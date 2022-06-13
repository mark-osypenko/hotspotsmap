//
//  HotspotAnnotationView.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import MapKit

class HotspotAnnotationView: MKAnnotationView {

    override var annotation: MKAnnotation? {
        didSet {
            guard let hotspotAnnotation = annotation as? HotspotAnnotation else { return }
            setup(using: hotspotAnnotation)
        }
    }

}

private extension HotspotAnnotationView {

    func setup(using hotspotAnnotation: HotspotAnnotation) {
        clusteringIdentifier = hotspotAnnotation.shouldClustering ? HotspotAnnotation.identifier : nil
        image = Asset.wifiCircleFill.image
    }

}
