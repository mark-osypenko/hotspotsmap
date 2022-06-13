//
//  ErrorDisplaying.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation
import UIKit

protocol ErrorDisplaying {

    func display(errorMessage: String)

}

extension ErrorDisplaying where Self: UIViewController {

    func display(errorMessage: String) {
        let alert = UIAlertController(title: L10n.generalErrorTitle,
                                      message: errorMessage,
                                      preferredStyle: .alert)
        alert.addAction(.init(title: L10n.cancel, style: .cancel))
        present(alert, animated: true)
    }

}
