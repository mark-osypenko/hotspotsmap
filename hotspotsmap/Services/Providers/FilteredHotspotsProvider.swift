//
//  FilteredHotspotsProvider.swift
//  hotspotsmap
//
//  Created by Osypenko Mark on 13.06.2022.
//

import Foundation

protocol FilteredHotspotsProvider: AnyObject {

    func fetchHotspots(in region: Region,
                       progressHandler: @escaping (Float) -> Void,
                       completion: @escaping (Result<[Hotspot], Error>) -> Void)

}
