//
//  PopularDestinationsDetailsOverviewView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 28/06/23.
//

import SwiftUI

struct PopularDestinationsDetailsOverviewView: View {
    let city, country: String
    let description: String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(city)
                .font(.system(size: 18, weight: .bold))
            Text(country)
            HStack {
                ForEach(0..<5, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                }
            }
            .padding(.top, 2)
            
            Text(description ?? "")
                .padding(.top, 4)
                .font(.system(size: 14))
            
            HStack { Spacer() }
        }
    }
}

struct PopularDestinationsDetailsOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsDetailsOverviewView(city: Destination.MOCK_DESTINATIONS[2].city,
                                               country: Destination.MOCK_DESTINATIONS[2].country,
                                               description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    }
}
