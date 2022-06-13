//
//  HotspotsStorage+FilteredProvider.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

extension HotspotsStorage: FilteredHotspotsProvider {

    func fetchHotspots(in region: Region,
                       progressHandler: @escaping (Float) -> Void,
                       completion: @escaping (Result<[Hotspot], Error>) -> Void) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            let filtered = self.hotspots.filter { region.contains(.init(.init(latitude: $0.latitude,
                                                                              longitude: $0.longitude))) }
            DispatchQueue.main.async {
                progressHandler(1)
                if filtered.count < 10000 {
                    completion(.success(filtered))
                } else {
                    completion(.failure(FilteredHotspotsProviderError.tooManyPoints))
                }
            }
        }
    }

}
