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
    
    func region() ->String{
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

//    init(_ region: String){
//        switch region{
//            case "Alaska":
//                self = .Alaska
//            case "Greater Atlantic":
//                self = .GreaterAtlantc
//            case "West Coast":
//                self = .WestCoast
//            case "Southeast":
//                self = .Southeast
//            default: //"Pacific Islands":
//                self = .PacificIslands
//        }
//    }
}
