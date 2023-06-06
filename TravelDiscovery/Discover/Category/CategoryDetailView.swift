//
//  CategoryDetailView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 06/06/23.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

struct CategoryDetailView: View {
    @ObservedObject var vm = CategoryDetailsViewModel()
    var body: some View {
        if vm.isLoading {
            VStack {
                ActivityIndicatorView()
                Text("Loading...")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding()
            .background(Color.black)
            .cornerRadius(8)
            
        } else {
            ZStack {
                Text(vm.errorMessage)
                ScrollView {
                    ForEach(vm.places, id: \.self) { place in
                        VStack(alignment: .leading, spacing: 0) {
                            KFImage(URL(string: place.thumbnail))
//                            WebImage(url: URL(string: place.thumbnail))
//                            AsyncImage(url: URL(string: place.thumbnail))
                                .resizable()
                                .scaledToFill()
                            Text(place.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }
                        .asTile()
                        .padding()
                    }
                }
            }
            .navigationBarTitle("Category", displayMode: .inline)
        }
    }
}

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    init() {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                guard let data = data else { return }
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON: ", error)
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        }.resume()
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView()
    }
}
