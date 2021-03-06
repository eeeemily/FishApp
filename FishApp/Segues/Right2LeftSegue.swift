//
//  Right2LeftSegue.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import UIKit

class Right2LeftSegue: UIStoryboardSegue {

    override func perform() {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.45, delay: 0, options: .curveEaseOut, animations: {
            dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            src.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)
        }, completion: { _ in
            src.present(dst, animated: false)
        })
    }
}
