//
//  CategoryDetailView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 06/06/23.
//

import SwiftUI

struct CategoryDetailView: View {
    private let name: String
    @ObservedObject private var vm: CategoryDetailsViewModel

    init(name: String) {
        self.name = name
        self.vm = .init(name: name)
    }

    var body: some View {
        if vm.isLoading {
            CategoryDetailLoadingView()
        } else {
            ZStack {
                if !vm.errorMessage.isEmpty {
                    CategoryDetailErrorView(errorMessage: vm.errorMessage)
                }
                ScrollView {
                    ForEach(vm.places, id: \.self) { place in
                        CategoryDetailCardView(place: place)
                    }
                }
            }
            .navigationBarTitle(name, displayMode: .inline)
        }
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailView(name: "Sports")
        }
    }
}
