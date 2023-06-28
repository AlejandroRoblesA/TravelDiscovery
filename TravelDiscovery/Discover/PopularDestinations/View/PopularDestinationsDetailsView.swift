//
//  PopularDestinationsDetailsView.swift
//  TravelDiscovery
//
//  Created by Alejandro Robles on 28/06/23.
//

import SwiftUI
import MapKit

struct PopularDestinationsDetailsView: View {
    @ObservedObject var vm: DestinationDetailsViewModel
    let destination: Destination
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    let attractions: [Attraction] = Attraction.MOCK_ATTRACTION

    init(destination: Destination) {
        self.destination = destination
        self.region = MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.07, longitudeDelta: 0.07))
        self.vm = .init(name: destination.city)
    }
    
    var body: some View {
        ScrollView {
            if let photos = vm.destinationDetails?.photos {
                DestinationHeaderContainer(imageURLString: photos, isBlackBackground: false)
                    .frame(height: 250)
            }
            PopularDestinationsDetailsOverviewView(city: destination.city, country: destination.country, description: vm.destinationDetails?.description)
            .padding(.horizontal)
            PopularDestinationsDetailsToggleAttractionsView(isShowingAttractions: $isShowingAttractions)
            .padding(.horizontal)
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
        }
        .navigationBarTitle(destination.city, displayMode: .inline)
    }
}

struct PopularDestinationsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsDetailsView(destination: Destination.MOCK_DESTINATIONS[1])
    }
}
