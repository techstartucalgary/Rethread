// MapView.swift

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @StateObject private var viewModel = MapViewModel() // MapViewModel can be fouund in Models/MapViewModels in the directory
    @State private var cameraPos: MapCameraPosition = .userLocation(fallback: .automatic)
    var body: some View {

        VStack {
            Text("Use your current postal code or enter a new one to see locations near you!")
                .padding()
                .foregroundStyle(Color(hex: "#2C4C52"))

            LocationSearchBar()

            Text("Locations Around you")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .foregroundStyle(Color(hex: "#2C4C52"))

            CustomDropdownMenu(items: [
                DropdownItem(id: 1, title: "24 Ave. NW", onSelect: {}),
                DropdownItem(id: 2, title: "32 Deer foot trail NE", onSelect: {}),
                DropdownItem(id: 3, title: "18 Blvd. Road W", onSelect: {})
            ])
            .zIndex(1000)
            .frame(maxHeight: .maximum(100, 100))
            .padding(.horizontal)


            Map(position: $cameraPos) {

            }
            .mapControls {
                MapCompass()
                MapUserLocationButton()
                MapPitchToggle()
            }
            .accentColor(Color(hex: "#2C4C52"))
            .onAppear {
                viewModel.isUserLocationOn()
            }
        }


    }
}

struct LocationSearchBar: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                TextField("Enter New Postal Code", text: $search)
                Image(systemName: "mappin.circle")
                    .foregroundStyle(Color(hex: "#2C4C52"))

            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background(.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                    .stroke(Color(hex: "#2C4C52"))
            )
        }
        .padding()


    }
}












#Preview {
    MapView()
}
