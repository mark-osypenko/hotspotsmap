//
//  ModuleProducer.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import UIKit

protocol ModuleProducer {

    associatedtype T: UIViewController

    func produce() -> T

}
