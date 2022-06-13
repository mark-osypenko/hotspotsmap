//
//  MapPresenter.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

class MapPresenter {

    weak var view: MapDisplayLogic?

}

// MARK: - MapPresentationLogic

extension MapPresenter: MapPresentationLogic {

    func startLoading() {
        view?.displayLoader()
    }

    func stopLoading() {
        view?.hideLoader()
    }

    func present(hotspots: [Hotspot], withCurrentZoomLevel zoomLevel: Double) {
        view?.display(annotations: hotspots.map { .init(coordinate: .init(latitude: $0.latitude, longitude: $0.longitude),
                                                        shouldClustering: zoomLevel > 200) })
    }

    func present(error: Error) {
        view?.display(errorMessage: error.localizedDescription)
    }

}
