//
//  CLLocation.swift
//  GVKit
//

import Foundation
import CoreLocation

public extension CLLocation {
    
    convenience init(coordinate2D: CLLocationCoordinate2D) {
        self.init(latitude: coordinate2D.latitude, longitude: coordinate2D.longitude)
    }
    
}
