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
    @IBOutlet weak var habitatLabel: UILabel!
    @IBOutlet weak var biologyLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(name: String, biology: String,habitat:String,fisheries:String) {
//        if let name = entry.value(forKey: "name") as? String,
//           let biology = entry.value(forKey: "biology") as? String,
//           let strength = entry.value(forKey: "strength") as? Int{
            
            nameLabel?.text = name
            biologyLabel?.text = biology
        habitatLabel?.text = habitat
        fisheriesLabel?.text = fisheries
    }
}
