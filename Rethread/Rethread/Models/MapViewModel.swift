// MapViewModel.swift

import MapKit

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }

    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    let locationManager: CLLocationManager

    private func checkLocationAuthorization () {
        switch locationManager.authorizationStatus {

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Sorry! Your location is restricted.")
        case .denied:
            print("You have denied ReThread the use of your location. Go into settings to allow premissions.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }

}
