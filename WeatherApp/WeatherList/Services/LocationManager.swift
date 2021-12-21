//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Silvia Kuzmova on 21.11.21.
//

import Foundation
import CoreLocation
import CoreLocationUI

struct Location: Equatable {
    let lat: Double
    let lon: Double
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: Location?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            // Request Current Location
            manager.requestLocation()

        } else {
            // Request Authorization
            manager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("did update location")
        guard let currentLocation = locations.first?.coordinate else { return }
        location = Location(lat: currentLocation.latitude, lon: currentLocation.longitude)

        manager.delegate = nil
        manager.stopUpdatingLocation()

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if location == nil {
            self.location = Location(lat: Defaults.Latitude, lon: Defaults.Longitude)
        }
    }
}

