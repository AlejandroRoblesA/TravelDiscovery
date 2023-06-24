//
//  CategoryDetailLoadingView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 23/06/23.
//

import SwiftUI

struct CategoryDetailLoadingView: View {
    var body: some View {
        VStack {
            ActivityIndicatorView()
            Text("Loading...")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
        }
        .padding()
        .background(Color.black)
        .cornerRadius(8)
    }
}

struct CategoryDetailLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailLoadingView()
    }
}
