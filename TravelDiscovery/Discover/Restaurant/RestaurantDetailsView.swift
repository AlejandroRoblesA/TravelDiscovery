//
//  RestaurantDetailsView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 09/06/23.
//

import SwiftUI

struct RestaurantDetailsView: View {
    var body: some View{
        ScrollView {
            Text("Details")
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView()
        }
    }
}
