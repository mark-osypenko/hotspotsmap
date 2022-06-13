//
//  SplashInteractor.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

class SplashInteractor {

    private let presenter: SplashPresentationLogic
    private let hotspotsProvider: HotspotsProvider
    private let router: SplashRouting

    init(presenter: SplashPresentationLogic,
         hotspotsProvider: HotspotsProvider,
         router: SplashRouting) {
        self.presenter = presenter
        self.hotspotsProvider = hotspotsProvider
        self.router = router
    }

}

// MARK: - SplashBusinessLogic

extension SplashInteractor: SplashBusinessLogic {

    func load() {
        hotspotsProvider.fetchHotspots { [weak presenter] in
            presenter?.present(progress: $0)
        } completion: { [weak self] in
            switch $0 {
            case .success(let hotspots):
                self?.router.showMap(hotspots: hotspots)
            case .failure(let error):
                self?.presenter.present(error: error)
            }
        }
    }

}
