//
//  DiscoverCategoriesImageAndLabelView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 23/06/23.
//

import SwiftUI

struct DiscoverCategoriesImageAndLabelView: View {
    let image: String
    let title: String
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .font(.system(size: 20))
                .foregroundColor(Color.orange)
                .frame(width: 64, height: 64)
                .background(Color.white)
                .cornerRadius(.infinity)
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .frame(width: 68)
    }
}

struct DiscoverCategoriesImageAndLabelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                Color.orange
                DiscoverCategoriesImageAndLabelView(image: "paintpalette.fill", title: "Art")
            }
        }
    }
}
