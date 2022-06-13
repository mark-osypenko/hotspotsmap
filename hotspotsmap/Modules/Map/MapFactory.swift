//
//  MapFactory.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

struct MapFactory: ModuleProducer {

    let hotspots: [Hotspot]

    func produce() -> MapViewController {
        let presenter = MapPresenter()
        let storage = HotspotsStorage(hotspots: hotspots)
        let provider = MapHotspotsLoader(provider: storage)
        let interactor = MapInteractor(presenter: presenter,
                                       provider: provider)
        let view = MapViewController(interactor: interactor)
        presenter.view = view
        return view
    }

}
