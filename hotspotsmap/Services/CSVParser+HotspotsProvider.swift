//
//  CSVParser+HotspotsProvider.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

extension CSVParser: HotspotsProvider {

    func fetchHotspots(progressHandler: @escaping (Float) -> Void,
                       completion: @escaping (Result<[Hotspot], Error>) -> Void) {
        DispatchQueue.global().async {
            do {
                let csv = try getCSVData { progressValue in
                    DispatchQueue.main.async {
                        progressHandler(progressValue)
                    }
                }
                let hotspots = csv.compactMap { Hotspot(dictionary: $0) }
                DispatchQueue.main.async {
                    completion(.success(hotspots))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

}

private extension Hotspot {

    init?(dictionary: [String: String]) {
        guard let id = dictionary["id"].flatMap({ UInt($0) }),
              let longitude = dictionary["lng"].flatMap({ Double($0) }),
              let latitude = dictionary["lat"].flatMap({ Double($0) }) else { return nil }
        self = .init(id: id, latitude: latitude, longitude: longitude)
    }

}
