//
//  MapHotspotsLoader.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

class MapHotspotsLoader: FilteredHotspotsProvider {

    private let provider: FilteredHotspotsProvider
    private var workItem: DispatchWorkItem?

    init(provider: FilteredHotspotsProvider) {
        self.provider = provider
    }

    func fetchHotspots(in region: Region,
                       progressHandler: @escaping (Float) -> Void,
                       completion: @escaping (Result<[Hotspot], Error>) -> Void) {
        workItem?.cancel()
        workItem = .init() { [weak provider] in
            provider?.fetchHotspots(in: region, progressHandler: progressHandler, completion: completion)
        }
        workItem.map { DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: $0) }
    }


}
