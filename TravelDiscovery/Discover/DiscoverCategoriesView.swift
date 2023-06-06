//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 04/06/23.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live events", imageName: "music.mic"),
        .init(name: "Food", imageName: "tray.fill"),
        .init(name: "History", imageName: "books.vertical.fill"),
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink {
                        CategoryDetailView()
                    } label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageName)
                                .font(.system(size: 20))
                                .foregroundColor(Color.orange)
                                .frame(width: 64, height: 64)
                                .background(Color.white)
                                .cornerRadius(.infinity)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 68)
                    }

                }
            }
            .padding(.horizontal)
        }
    }
}

struct CategoryDetailView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<5, id: \.self) { _ in
                VStack(alignment: .leading, spacing: 0) {
                    Image("art1")
                        .resizable()
                        .scaledToFill()
                    Text("Demo")
                        .font(.system(size: 12, weight: .semibold))
                        .padding()
                }
                .asTile()
                .padding()
            }
        }
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange
            DiscoverCategoriesView()
        }
    }
}
