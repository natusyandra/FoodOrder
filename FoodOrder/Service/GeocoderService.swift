//
//  GeocoderService.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 17.07.2023.
//

import Foundation
import CoreLocation

class GeocoderService {
    
    private var manager = LocationManager()
    
    public func run(callback: @escaping (String?) -> Void) {
        manager.run { location in
            guard let location else { return }
            let locale = Locale.init(identifier: "ru_RU")
            CLGeocoder().reverseGeocodeLocation(location, preferredLocale: locale) { (placemarks, error) in
                guard error == nil else { return}
                if let administrativeArea = placemarks?.first?.administrativeArea {
                    callback(administrativeArea)
                }
            }
        }
    }
}

private class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var locationCallback: ((CLLocation?) -> Void)!
    var locationServicesEnabled = false
    var didFailWithError: Error?
    
    public func run(callback: @escaping (CLLocation?) -> Void) {
        locationCallback = callback
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.requestWhenInUseAuthorization()
        locationServicesEnabled = CLLocationManager.locationServicesEnabled()
        if locationServicesEnabled { manager.startUpdatingLocation() }
        else { locationCallback(nil) }
    }
    
    public func locationManager(_ manager: CLLocationManager,
                                didUpdateLocations locations: [CLLocation]) {
        locationCallback(locations.last!)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        didFailWithError = error
        locationCallback(nil)
    }
    
    deinit {
        manager.stopUpdatingLocation()
    }
}
