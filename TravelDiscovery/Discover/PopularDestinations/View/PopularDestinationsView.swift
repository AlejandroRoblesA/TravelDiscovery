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

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationsDetailsView(destination: .init(city: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
        }
        PopularDestinationsView()
        DiscoverView()
    }
}
