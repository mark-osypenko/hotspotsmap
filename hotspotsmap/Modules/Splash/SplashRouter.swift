//
//  SplashRouter.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import UIKit

class SplashRouter: SplashRouting {

    weak var viewController: UIViewController?

    func showMap(hotspots: [Hotspot]) {
        let mapView = MapFactory(hotspots: hotspots).produce()
        viewController?.view.window?.setRootViewController(mapView)
    }

}
