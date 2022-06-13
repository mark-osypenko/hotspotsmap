//
//  FilteredHotspotsProviderError.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

enum FilteredHotspotsProviderError: Error, LocalizedError {

    case tooManyPoints

    var errorDescription: String? {
        switch self {
        case .tooManyPoints:
            return L10n.tooManyPointsError
        }
    }

}
