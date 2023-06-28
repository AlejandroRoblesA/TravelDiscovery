//
//  PopularDestinationsDetailsToggleAttractionsView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 28/06/23.
//

import SwiftUI

struct PopularDestinationsDetailsToggleAttractionsView: View {
    @Binding var isShowingAttractions: Bool
    var body: some View {
        HStack {
            Text("Location")
                .font(.system(size: 18, weight: .semibold))
            Spacer()
            Button(action: {
                isShowingAttractions.toggle()
            }) {
                Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                    .font(.system(size: 12, weight: .semibold))
            }
            Toggle("", isOn: $isShowingAttractions)
                .labelsHidden()
        }
    }
}

struct PopularDestinationsDetailsToggleAttractionsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsDetailsToggleAttractionsView(isShowingAttractions: .constant(true))
    }
}
