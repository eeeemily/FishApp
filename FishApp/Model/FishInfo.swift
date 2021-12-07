//
//  FishInfo.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation
class FishInfo {
    
    var fishs = [Fish]()
    var chosenFishes = [Fish]()
    func addFish(name: String, protein: String, quote: String, fisheries: String, pic: String) {
        fishs.append(Fish(name: name, protein: protein, quote: quote, fisheries: fisheries, pic: pic))
    }
    func fishes(for region: String) -> [Fish] {
        let filtered = fishs.filter{
            var curArr:NSString = $0.fisheries.description as NSString
            
            return curArr.contains(region)
        }
        print("before",chosenFishes.count)
        chosenFishes = filtered
        print("after",chosenFishes.count)

        print(filtered.count)
        return filtered
    }
    func randomFishPic()->String{
        return chosenFishes.randomElement()!.pic
    }
    
}




