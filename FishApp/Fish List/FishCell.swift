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
    
    let imageHelper = ImageHelper()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    

    func update(name: String, protein: String,quote:String,fisheries:String, pic:String) {
        nameLabel?.text = name
        proteinLabel?.text = "Protein: "+protein
        quoteLabel?.text = "About: "+quote
        fisheriesLabel?.text = "Region: "+fisheries
        loadPhoto(urlString: pic)
    }
    func loadPhoto(urlString: String){
        imageHelper.fetchImage(url: urlString) { result in
            switch result {
            case let .Success(image):
                OperationQueue.main.addOperation() {
                    self.fishImg?.image = image
                }
            case let .Failure(error):
                OperationQueue.main.addOperation {
                    self.fishImg?.image = nil
                }
                print("error: \(error)")
            }
        }
        
    }
}
