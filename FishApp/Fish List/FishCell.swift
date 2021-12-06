//
//  FishListVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import UIKit

class FishCell: UITableViewCell {
    @IBOutlet weak var fishImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fisheriesLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(name: String, protein: String,quote:String,fisheries:String) {
        nameLabel?.text = name
        proteinLabel?.text = protein
        quoteLabel?.text = quote
        fisheriesLabel?.text = fisheries
    }
}
