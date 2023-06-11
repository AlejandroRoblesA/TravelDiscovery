//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 11/06/23.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: proxy.size.width/3-4, maximum: 300), spacing: 2),
                ], spacing: 4) {
                    ForEach(0..<14, id: \.self) { _ in
                        Image("tapas")
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width/3-3, height: proxy.size.width/3-3)
                            .clipped()
                    }
                }
                .padding(.horizontal, 2)
            }
        }
        .navigationBarTitle("All photos", displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView()
        }
    }
}
