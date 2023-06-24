//
//  CategoryDetailCardImageView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 23/06/23.
//

import SwiftUI
import Kingfisher

struct CategoryDetailCardView: View {
    let place: Place
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            KFImage(URL(string: place.thumbnail))
                .resizable()
                .scaledToFit()
            Text(place.name)
                .font(.system(size: 12, weight: .semibold))
                .padding()
        }
        .asTile()
        .padding()
    }
}

struct CategoryDetailCardImageView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailCardView(place: .init(name: "Art Academy", thumbnail: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/42eb62ad-8f4a-4fdd-8ed2-3a7614a2f9e2"))
    }
}
