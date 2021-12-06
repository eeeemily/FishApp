//
//  FishInfo.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation
class FishInfo {
    
    var fishs = [Fish]()
    
    func addFish(name: String, protein: String, quote: String, fisheries: String) {
        fishs.append(Fish(name: name, protein: protein, quote: quote, fisheries: fisheries))
    }
    
    func getFishs() -> [Fish]{
        return fishs
    }
    
}




