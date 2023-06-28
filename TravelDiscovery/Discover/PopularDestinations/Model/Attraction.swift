//
//  Attraction.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 28/06/23.
//

import Foundation

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name, imageName: String
    let latitude, longitude: Double
}

extension Attraction {
    static var MOCK_ATTRACTION: [Attraction] = [
        .init(name: "eiffel_tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees", imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", imageName: "art2", latitude: 48.860288, longitude: 2.337789)
    ]
}
