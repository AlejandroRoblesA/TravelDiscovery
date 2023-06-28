//
//  PopularDestinationTile.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 28/06/23.
//

import SwiftUI

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

struct PopularDestinationTile_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationTile(destination: .init(city: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
    }
}
