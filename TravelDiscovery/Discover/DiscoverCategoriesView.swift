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

struct Place: Decodable, Hashable {
    let name, thumbnail: String
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

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
    
    
}

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
                            Image("art1")
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

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                Color.orange
                DiscoverCategoriesView()
            }
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}