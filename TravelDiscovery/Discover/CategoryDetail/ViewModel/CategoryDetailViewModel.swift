//
//  CategoryDetailViewModel.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 23/06/23.
//

import Foundation

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    init(name: String) {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: urlString)
        else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Bad status: \(statusCode)"
                    return
                }

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
