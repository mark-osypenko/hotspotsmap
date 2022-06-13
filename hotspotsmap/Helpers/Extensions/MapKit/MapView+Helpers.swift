//
//  MapView+Helpers.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import MapKit

extension MKAnnotation {

    static var identifier: String { "\(Self.self)" }

}

extension MKMapView {

    func register<T: MKAnnotationView>(view: T.Type, for annotation: MKAnnotation.Type) {
        register(T.self, forAnnotationViewWithReuseIdentifier: annotation.identifier)
    }

    func dequeue(for annotation: MKAnnotation) -> MKAnnotationView {
        dequeueReusableAnnotationView(withIdentifier: type(of: annotation).identifier, for: annotation)
    }

}
