//
//  FisheriesRegion.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation
import UIKit

enum FisheriesRegion: Int, CaseIterable{
    case Alaska, GreaterAtlantc, WestCoast, Southeast, PacificIslands
    func with() ->String{
        switch self{
        case .Alaska:
            return "Alaska"
        case .GreaterAtlantc:
            return "Greater Atlantic"
        case .WestCoast:
            return "West Coast"
        case .Southeast:
            return "Southeast"
        case .PacificIslands:
            return "Pacific Islands"
        }
    }
}
