//
//  TitleSectionView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 28/06/23.
//

import SwiftUI

struct TitleSectionView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }
    }
}

struct TitleSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TitleSectionView(title: "Popular places to eat")
    }
}
