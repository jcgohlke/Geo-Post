//
//  LocationService.swift
//  Geo Post
//
//  Created by Joben Gohlke on 9/9/21.
//

import Foundation
import CoreLocation

class LocationService: NSObject {
  static let shared = LocationService()
  
  var group: DispatchGroup?
  private let locationManager = CLLocationManager()
  
  override init() {
    super.init()
    
    locationManager.delegate = self
  }
  
  func getCurrentLocation(completion: @escaping (CLLocationCoordinate2D?) -> Void) {
    group = DispatchGroup()
    
    group?.enter()
    locationManager.requestLocation()
    
    group?.notify(queue: .main) {
      let coordinate = self.locationManager.location?.coordinate
      self.group = nil
      completion(coordinate)
    }
  }
  
  
  func requestLocationAuthorization() {
    if locationManager.authorizationStatus == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    }
  }
}

extension LocationService: CLLocationManagerDelegate {
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if manager.authorizationStatus == .authorizedWhenInUse {
      manager.startUpdatingLocation()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    group?.leave()
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    NSLog("Location manager did fail with error: \(error)")
  }
}
