//
//  MapPresentationLogic.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

protocol MapPresentationLogic {

    func present(hotspots: [Hotspot], withCurrentZoomLevel zoomLevel: Double)
    func present(error: Error)
    func startLoading()
    func stopLoading()

}
