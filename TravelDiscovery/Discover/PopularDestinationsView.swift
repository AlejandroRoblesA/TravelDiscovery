//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 04/06/23.
//

import SwiftUI

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(city: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitud: 2.353235),
        .init(city: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitud: 139.7695),
        .init(city: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitud: -74.0055),
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
                            PopularDestinationsDetailsView(destination: destination)
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

struct PopularDestinationsDetailsView: View {
    let destination: Destination
    @State var region: MKCoordinateRegion
    
    init(destination: Destination) {
        self.destination = destination
        self.region = MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitud), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
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
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .padding(.top, 4)
                    .font(.system(size: 14))
                
                HStack { Spacer() }
            }
            .padding(.horizontal)
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal)
            Map(coordinateRegion: $region)
                .frame(height: 200)
                
        }
        .navigationBarTitle(destination.city, displayMode: .inline)
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationsDetailsView(destination: .init(city: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitud: 2.353235))
        }
        PopularDestinationsView()
        DiscoverView()
    }
}
