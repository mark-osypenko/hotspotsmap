//
//  CSVParser.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

typealias CSV = [[String: String]]

struct CSVParser {

    let fileName: String

    func getCSVData(delimiter: String = ",", _ progress: (Float) -> Void) throws -> CSV {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            throw CSVParserError.fileNotFound
        }

        guard let content = try? String(contentsOfFile: url.path) else {
            throw CSVParserError.emptyFile
        }

        let lines = content.components(separatedBy: .newlines)

        guard let headers = lines.first?.components(separatedBy: delimiter) else {
            throw CSVParserError.emptyFile
        }

        return getCSVData(lines: .init(lines.dropFirst()),
                          headers: headers,
                          delimiter: delimiter,
                          progress)
    }

}

private extension CSVParser {

    func getCSVData(lines: [String],
                    headers: [String],
                    delimiter: String,
                    _ progress: (Float) -> Void) -> CSV {
        lines.enumerated().map {
            progress(Float($0.offset) / Float(lines.count))
            return $0.element.components(separatedBy: delimiter)
                .enumerated()
                .reduce(into: .init()) {
                    $0[headers[$1.offset]] = $1.element
                }
        }
    }

}
