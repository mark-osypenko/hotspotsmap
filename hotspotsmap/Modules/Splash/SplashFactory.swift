//
//  SplashFactory.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

struct SplashFactory: ModuleProducer {

    func produce() -> SplashViewController {
        let presenter = SplashPresenter()
        let router = SplashRouter()
        let interactor = SplashInteractor(presenter: presenter,
                                          hotspotsProvider: CSVParser(fileName: "hotspots.csv"),
                                          router: router)
        let view = SplashViewController(interactor: interactor)
        presenter.view = view
        router.viewController = view
        return view
    }

}
