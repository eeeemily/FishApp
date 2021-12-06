//
//  FishResults.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation

import Foundation

struct FishResults: Decodable {
    var name: String
    var biology: String
    var habitat: String
    var fisheries: String
}

class FishResult: Decodable {

//    enum CodingKeys: String, CodingKey {
//        case activity
//    }
//    
//    var activity: Activity?
//    
//    init() {
//        activity = nil
//    }
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        activity = try container.decode(Activity.self, forKey: .activity)
//    }
}
