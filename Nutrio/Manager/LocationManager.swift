import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    @Published var location: CLLocation?
    @Published var placemark: CLPlacemark?
    @Published var isPermissionDenied = false
    @Published var isPermissionNotDetermined = false

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        checkPermissionStatus()
    }

    func requestLocationPermission() {
        manager.requestWhenInUseAuthorization()
    }

    func checkPermissionStatus() {
        let status = manager.authorizationStatus
        DispatchQueue.main.async {
            self.isPermissionDenied = (status == .denied || status == .restricted)
            self.isPermissionNotDetermined = (status == .notDetermined)
        }

        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkPermissionStatus()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        location = newLocation
        reverseGeocode(location: newLocation)
    }

    func reverseGeocode(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                DispatchQueue.main.async {
                    self.placemark = placemark
                }
            }
        }
    }
}
