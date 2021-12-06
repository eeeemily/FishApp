//
//  Fish.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation

class Fish {
    
    var name: String
    var biology: String
    var habitat: String
    var fisheries: String
    
    init(name: String, biology: String, habitat: String, fisheries: String) {
        
        self.name = name
        self.biology = biology
        self.habitat = habitat
        self.fisheries = fisheries
    }
    
//    convenience init(title: String, genre: GenreType, released: Int) {
//        self.init(title: title, genre: genre, released: released, rating: 0)
//    }
}
