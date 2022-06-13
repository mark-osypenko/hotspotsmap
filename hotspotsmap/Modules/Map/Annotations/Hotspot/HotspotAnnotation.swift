//
//  HotspotAnnotation.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation
import MapKit

class HotspotAnnotation: NSObject, MKAnnotation {

    let coordinate: CLLocationCoordinate2D
    let shouldClustering: Bool

    init(coordinate: CLLocationCoordinate2D,
         shouldClustering: Bool) {
        self.coordinate = coordinate
        self.shouldClustering = shouldClustering
    }

}
