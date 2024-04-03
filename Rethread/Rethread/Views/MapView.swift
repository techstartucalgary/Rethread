// MapView.swift
import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @StateObject private var viewModel = MapViewModel() // MapViewModel can be fouund in Models/MapViewModels in the directory
    @State private var cameraPos: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var mapSelection: MKMapItem?
    @State private var viewingRegion: MKCoordinateRegion?

    @State private var searchText: String = ""
    @State private var showSearch: Bool = false
    @State private var searchResults: [MKMapItem] = []

    @State private var showDetails: Bool = false
    @State private var lookAroundScene: MKLookAroundScene?

    @State private var routeDisplaying: Bool = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapItem?

    var body: some View {


//        VStack {
//            Text("meow")
//        }
        NavigationStack {

            Map(position: $cameraPos, selection: $mapSelection) {

                    ForEach(searchResults, id: \.self) { mapItem in
                        if routeDisplaying {
                            if mapItem == routeDestination {
                                let placemark = mapItem.placemark
                                Marker(placemark.name ?? "Place", coordinate: placemark.coordinate)
                                    .tint(Color(hex: "#2C4C52"))
                            }
                        } else {
                            let placemark = mapItem.placemark
                            Marker(placemark.name ?? "Place", coordinate: placemark.coordinate)
                                .tint(Color(hex: "#2C4C52"))
                        }
                    }

                if let route {
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 7)
                }

                }
            .onMapCameraChange({ ctx in
                viewingRegion = ctx.region
            })
                .searchable(text: $searchText, isPresented: $showSearch)
                .navigationTitle("Brands Near You!")
                .accentColor(Color(hex: "#2C4C52"))
                .mapControls {
                    MapCompass()
                    MapUserLocationButton()
                    MapPitchToggle()
                }
                .toolbar(routeDisplaying ? .hidden : .visible, for: .navigationBar)
                .sheet(isPresented: $showDetails, onDismiss: {
                    withAnimation(.snappy) {
                        if let boundingRect = route?.polyline.boundingMapRect, routeDisplaying {
                            cameraPos = .rect(boundingRect)
                        }
                    }
                }, content: {
                    MapDetails()
                        .presentationDetents([.height(300)])
                        .presentationBackgroundInteraction(.enabled(upThrough: .height(300)))
                        .presentationCornerRadius(25)
                        .interactiveDismissDisabled(true)
                })
                .safeAreaInset(edge: .bottom) {
                    if routeDisplaying {
                        Button("End Route") {
                            withAnimation(.snappy) {
                                routeDisplaying = false
                                showDetails = true
                                mapSelection = routeDestination
                                routeDestination = nil
                                route = nil
                                cameraPos = .region(viewModel.region)
                            }
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(.red.gradient, in: .rect(cornerRadius: 15))
                        .padding()
                        .background(.ultraThinMaterial)

                    }
                }
                .onSubmit(of: .search) {
                    print("Search submitted for: \(searchText)")
                   Task {
                       guard !searchText.isEmpty else { return }
                       print("Starting search...")
                       await searchPlaces()
                   }
                }
                .onChange(of: showSearch, initial: false) {
                    if !showSearch {
                        searchResults.removeAll(keepingCapacity: false)
                        showDetails = false

                        withAnimation(.snappy) {
                            cameraPos = .region(viewModel.region)
                        }
                    }
                }
                .onChange(of: mapSelection) { oldValue, newValue in
                    showDetails = newValue != nil
                    fetchLookAroundData()
                }
        }


    }

    @ViewBuilder
    func MapDetails() -> some View {
        VStack(spacing: 15) {
            ZStack {
                if lookAroundScene == nil {
                    ContentUnavailableView("No Preview Available", systemImage: "eye.slash")
                } else {
                    LookAroundPreview(scene: $lookAroundScene)
                }
            }
            .frame(height: 200)
            .clipShape(.rect(cornerRadius: 15))
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    showDetails = false
                    withAnimation(.snappy) {
                        mapSelection = nil
                    }
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(.black)
                        .background(.white, in:.circle)
                })
            }

            Button("Get Directions", action: fetchRoute)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(.blue.gradient, in: .rect(cornerRadius: 15))
        }
        .padding(15)
    }



    func searchPlaces() async {
        print("Starting search for: \(searchText)")

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = viewingRegion ?? viewModel.region

        do {
            let response = try await MKLocalSearch(request: request).start()
            searchResults = response.mapItems
            print("Search completed. Found \(searchResults.count) results.")
        } catch {
            print("Search failed with error: \(error)")
        }
    }


    ///  Fetching Look Around data :)
    
    func fetchLookAroundData() {
        guard let mapSelection else { return }
        lookAroundScene = nil
        Task {
            let request = MKLookAroundSceneRequest(mapItem: mapSelection)
            lookAroundScene = try? await request.scene
        }
    }


    func fetchRoute() {
        guard let mapSelection else { return }
        let request = MKDirections.Request()
        request.source = .init(placemark: .init(coordinate: viewModel.locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)))
        request.destination = mapSelection

        Task {
            let result = try? await MKDirections(request: request).calculate()
            route = result?.routes.first
            routeDestination = mapSelection


            withAnimation(.snappy) {
                routeDisplaying = true
                showDetails = false

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
