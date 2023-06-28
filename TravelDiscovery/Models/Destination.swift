//
//  Destination.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 04/06/23.
//

import Foundation

struct Destination: Hashable {
    let city, country, imageName: String
    let latitude, longitude: Double
}

extension Destination {
    static var MOCK_DESTINATIONS: [Destination] = [
        .init(city: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235),
        .init(city: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
        .init(city: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055),
        ]
}
