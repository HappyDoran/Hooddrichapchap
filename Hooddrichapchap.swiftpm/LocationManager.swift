//
//  ContentViewModel.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/21/24.
//

import SwiftUI
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var currentLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        self.locationManager.delegate = self 
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location.coordinate
    }
}

extension CLLocationCoordinate2D {
    static let sejongCat = CLLocationCoordinate2D(latitude: 36.0150, longitude: 129.3249)
    static let chungangDog = CLLocationCoordinate2D(latitude: 36.0157, longitude: 129.3230)
    static let polarBear = CLLocationCoordinate2D(latitude: 36.01766937526957, longitude: 129.32190474432298)
}
