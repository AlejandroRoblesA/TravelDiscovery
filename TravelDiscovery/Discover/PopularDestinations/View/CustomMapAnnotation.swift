//
//  CustomMapAnnotation.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 28/06/23.
//

import SwiftUI

struct CustomMapAnnotation: View {
    let attraction: Attraction
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .foregroundColor(.white)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(.init(white: 0, alpha: 0.5)))
            )
        }
        .shadow(radius: 5)
    }
}

struct CustomMapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapAnnotation(attraction: .init(name: "eiffel_tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946))
    }
}
