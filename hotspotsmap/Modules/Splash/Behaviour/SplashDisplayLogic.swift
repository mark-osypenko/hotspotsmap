//
//  SplashDisplayLogic.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

protocol SplashDisplayLogic: AnyObject, ErrorDisplaying {

    func display(progress: Float)
    func display(errorMessage: String)
    func hideLoader()

}
