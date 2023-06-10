//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 04/06/23.
//

import SwiftUI

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(city: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235),
        .init(city: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
        .init(city: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055),
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(destinations, id: \.self) { destination in
                        NavigationLink {
                            NavigationLazyView(PopularDestinationsDetailsView(destination: destination))
                        } label: {
                            PopularDestinationTile(destination: destination)
                                .padding(.bottom)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationTile: View {
    let destination: Destination
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(4)
                .padding(.all, 6)
            Text(destination.city)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}

import MapKit

struct DestinationDetails: Decodable {
    let description: String
    let photos: [String]
}


class DestinationDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var destinationDetails: DestinationDetails?
    
    init(name: String) {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: urlString ) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                // make sure to check your error and response
                guard let data = data else { return }
                do {
                    self.destinationDetails = try JSONDecoder().decode(DestinationDetails.self, from: data)
                } catch {
                    print("Failed to decode JSON", error)
                }
            }
        }.resume()
    }
}

struct PopularDestinationsDetailsView: View {
    @ObservedObject var vm: DestinationDetailsViewModel
    let destination: Destination
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    
    init(destination: Destination) {
        self.destination = destination
        self.region = MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.07, longitudeDelta: 0.07))
        self.vm = .init(name: destination.city)
    }
    
    let imagesURLString = [
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531"
    ]
    
    var body: some View {
        ScrollView {
            if let photos = vm.destinationDetails?.photos {
                DestinationHeaderContainer(imageURLString: photos)
                    .frame(height: 250)
            }
            VStack(alignment: .leading) {
                Text(destination.city)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                HStack {
                    ForEach(0..<5, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }
                .padding(.top, 2)
                
                Text(vm.destinationDetails?.description ?? "")
                    .padding(.top, 4)
                    .font(.system(size: 14))
                
                HStack { Spacer() }
            }
            .padding(.horizontal)
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Button(action: {
                    isShowingAttractions.toggle()
                }) {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                        .font(.system(size: 12, weight: .semibold))
                }
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
            }
            .padding(.horizontal)
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
        }
        .navigationBarTitle(destination.city, displayMode: .inline)
    }
    let attractions: [Attraction] = [
        .init(name: "eiffel_tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees", imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", imageName: "art2", latitude: 48.860288, longitude: 2.337789)
    ]
}

struct CustomMapAnnotation: View {
    let attraction: Attraction
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .foregroundColor(.white)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(.init(white: 0, alpha: 0.5)))
            )
        }
        .shadow(radius: 5)
    }
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name, imageName: String
    let latitude, longitude: Double
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationsDetailsView(destination: .init(city: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
        }
        PopularDestinationsView()
        DiscoverView()
    }
}
