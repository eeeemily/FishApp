//
//  Botto2Top.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import UIKit

class Bottom2Top: UIStoryboardSegue {
    
    override func perform() {
        let src = self.source
        let dst = self.destination

        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: 0, y: src.view.frame.size.width)
        
        UIView.animate(withDuration: 0.45, delay: 0.0, options: .curveEaseInOut, animations: {
            dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            
            // animate source as well or comment out for "over" animation
//            source.view.transform = CGAffineTransform(translationX: 0, y: -source.view.frame.size.height)
        }) { _ in
            src.present(dst, animated: false)
        }
    }
}

