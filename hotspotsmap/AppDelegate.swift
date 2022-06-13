//
//  AppDelegate.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let splashView = SplashFactory().produce()
        window = .init(frame: UIScreen.main.bounds)
        window?.rootViewController = splashView
        window?.makeKeyAndVisible()

        return true
    }

}

