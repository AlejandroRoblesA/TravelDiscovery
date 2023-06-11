//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 11/06/23.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.fixed(125), spacing: 4),
                GridItem(.fixed(125), spacing: 4),
                GridItem(.fixed(125))
            ], spacing: 4) {
                ForEach(0..<14, id: \.self) { _ in
                    Text("Placeholder")
                        .padding()
                        .background(Color.red)
                }
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
