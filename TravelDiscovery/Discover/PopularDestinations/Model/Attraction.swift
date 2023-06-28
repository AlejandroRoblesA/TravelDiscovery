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
