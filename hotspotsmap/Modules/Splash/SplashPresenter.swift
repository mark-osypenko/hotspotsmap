//
//  SplashPresenter.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

class SplashPresenter {

    weak var view: SplashDisplayLogic?

}

// MARK: - SplashPresentationLogic

extension SplashPresenter: SplashPresentationLogic {

    func present(progress: Float) {
        view?.display(progress: progress)
    }

    func present(error: Error) {
        view?.display(errorMessage: error.localizedDescription)
        view?.display(progress: .zero)
        view?.hideLoader()
    }

}
