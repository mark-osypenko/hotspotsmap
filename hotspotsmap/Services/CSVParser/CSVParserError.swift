//
//  CSVParserError.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

enum CSVParserError: Error, LocalizedError {

    case emptyFile
    case fileNotFound

    var errorDescription: String? {
        switch self {
        case .emptyFile:
            return L10n.unknownError
        case .fileNotFound:
            return L10n.unknownError
        }
    }

}
