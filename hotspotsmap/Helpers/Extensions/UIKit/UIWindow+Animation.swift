//
//  UIWindow+Animation.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import UIKit

extension UIWindow {

    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        rootViewController = vc
        makeKeyAndVisible()

        UIView.transition(with: self,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }

}
