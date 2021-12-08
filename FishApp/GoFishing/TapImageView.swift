//
//  TapImageView.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/7/21.
//


import UIKit

protocol TapViewDelegate: AnyObject {
//    func showInfo(_ recognizer: UIGestureRecognizer, type: String)
//    func reset()
}

class TapImageView: UIImageView {
    
    weak var delegate: TapViewDelegate?
    
}
