//
//  FishInfo.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation
class FishInfo {
    
    var fishs = [Fish]()
    
    func addFish(name: String, protein: String, quote: String, fisheries: String, pic: String) {
        fishs.append(Fish(name: name, protein: protein, quote: quote, fisheries: fisheries, pic: pic))
    }
    func fishes(for region: FisheriesRegion) -> [Fish] {
        let filtered = fishs.filter{
            var curArr = String($0.fisheries)
            curArr.contains(region)
        }
        print(filtered)
        return filtered
    }
}




