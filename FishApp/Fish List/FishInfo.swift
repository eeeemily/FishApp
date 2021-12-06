//
//  FishInfo.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation
class FishInfo {
    
    var fishs = [Fish]()
    
    func addFish(name: String, biology: String, habitat: String, fisheries: String) {
        fishs.append(Fish(name: name, biology: biology, habitat: habitat, fisheries: fisheries))
    
//
//    func fishs(for genreType: GenreType) -> [Fish] {
//        return fishs.filter { $0.genre == genreType }
//    }
    }}



