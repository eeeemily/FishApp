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
            var curArr:NSString = $0.fisheries.description as NSString
            
            return curArr.contains(region.region())
        }
        print(filtered)
        return filtered
    }
}




