//
//  SplashPresentationLogic.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

protocol SplashPresentationLogic: AnyObject {

    func present(progress: Float)
    func present(error: Error)

}
