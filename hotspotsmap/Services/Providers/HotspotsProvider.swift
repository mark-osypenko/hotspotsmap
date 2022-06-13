//
//  HotspotsProvider.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

protocol HotspotsProvider {

    func fetchHotspots(progressHandler: @escaping (Float) -> Void,
                       completion: @escaping (Result<[Hotspot], Error>) -> Void)

}
