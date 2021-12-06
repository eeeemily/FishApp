//
//  Fish.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/5/21.
//

import Foundation

struct Activity: Decodable {
    var activity: String
    var accessibility: Double
    var type: String
    var participants: Int
    var price: Double
    var link: String
    var key: String
}

class FishDecode: Decodable {

    enum CodingKeys: String, CodingKey {
        case activity
    }
    
    var activity: Activity?
    
    init() {
        activity = nil
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        activity = try container.decode(Activity.self, forKey: .activity)
    }
}
