//
//  MapDisplayLogic.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

protocol MapDisplayLogic: AnyObject, ErrorDisplaying {

    func display(annotations: [HotspotAnnotation])
    func displayLoader()
    func hideLoader()

}
