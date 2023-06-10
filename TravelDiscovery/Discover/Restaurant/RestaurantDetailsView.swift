//
//  RestaurantDetailsView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 09/06/23.
//

import SwiftUI
import Kingfisher

struct RestaurantDetails: Decodable {
    let description: String
}

class RestaurantDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var details: RestaurantDetails?

    init () {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.details = try? JSONDecoder().decode(RestaurantDetails.self, from: data)
                
            }
        }.resume()
    }
}


struct RestaurantDetailsView: View {
    @ObservedObject var vm = RestaurantDetailsViewModel()
    let restaurant: Restaurant
    var body: some View{
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        HStack {
                            ForEach(0..<5, id: \.self) { _ in
                                Image(systemName: "star.fill")
                            }
                            .foregroundColor(.orange)
                        }
                    }
                    Spacer()
                    Text("See more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }
                .padding()
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Location & Description")
                    .font(.system(size: 16, weight: .bold))
                Text("Tokyo, Japan")
                HStack {
                    ForEach(0..<5, id: \.self) { _ in
                        Image(systemName: "dollarsign.circle.fill")
                    }
                    .foregroundColor(.orange)
                }
                Text(vm.details?.description ?? "")
                    .padding(.top, 8)
                    .font(.system(size: 14, weight: .regular))
            }
            .padding()
            HStack {
                Text("Popular Dishes")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5, id: \.self) { _ in
                        VStack(alignment: .leading) {
                            KFImage(URL(string: ""))
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                                .cornerRadius(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray)
                                )
                                .shadow(radius: 2)
                                .padding(.vertical, 4)
                            Text("Japanese Tapas")
                                .font(.system(size: 14, weight: .bold))
                            Text("88 photos")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(restaurant: .init(name: "Japan's Finest Tapas", image: "tapas"))
        }
    }
}
