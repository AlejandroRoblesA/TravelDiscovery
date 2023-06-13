//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 02/06/23.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct DiscoverView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient:
                                Gradient(colors:
                                            [Color(UIColor(red: 253/255,
                                                           green: 169/255,
                                                           blue: 50/255,
                                                           alpha: 1)),
                                             Color(UIColor(red: 253/255,
                                                           green: 130/255,
                                                           blue: 48/255,
                                                           alpha: 1))]),
                               startPoint: .top,
                               endPoint: .center)
                    .ignoresSafeArea()
                Color.defaultBackground
                    .offset(y: 400)
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    DiscoverCategoriesView()
                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }
                    .background(Color.defaultBackground)
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
                .navigationTitle("Discover")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            .colorScheme(.dark)
        DiscoverView()
            .colorScheme(.light)
    }
}
