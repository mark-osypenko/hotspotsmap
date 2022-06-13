//
//  MapInteractor.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

class MapInteractor {

    private let presenter: MapPresentationLogic
    private let provider: FilteredHotspotsProvider

    init(presenter: MapPresentationLogic,
         provider: FilteredHotspotsProvider) {
        self.presenter = presenter
        self.provider = provider
    }

}

// MARK: - MapBusinessLogic

extension MapInteractor: MapBusinessLogic {

    func load(in region: Region, with zoomLevel: Double) {
        presenter.startLoading()
        provider.fetchHotspots(in: region, progressHandler: { _ in }) { [weak self] result in
            self?.presenter.stopLoading()
            switch result {
            case .success(let hotspots):
                self?.presenter.present(hotspots: hotspots, withCurrentZoomLevel: zoomLevel)
            case .failure(let error):
                self?.presenter.present(error: error)
            }
        }
    }

}
