//
//  CookingVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//get a random fish to cook //by swipping! -> alert -> and then click cook


import UIKit

class CookingVC: UIViewController {
    @IBOutlet weak var panImgView: UIImageView!
    @IBOutlet weak var containerImgView: UIImageView!
    @IBOutlet weak var fishImageView: UIImageView!
//    var fishInfo: FishInfo!
    var cookingFish = FishInfo()

    var fishingVC = FishingVC()
    let imageHelper = ImageHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFishes()
        panImgView.isHidden = true
        fetchFish(urlString: cookingFish.fishs.randomElement()!.pic)
//        var random = fishInfo.randomFishPic()
        
    }
    func fetchFish(urlString: String){
        imageHelper.fetchImage(url: urlString) { result in
            switch result {
            case let .Success(image):
                OperationQueue.main.addOperation() {
                    self.fishImageView?.image = image
                }
            case let .Failure(error):
                OperationQueue.main.addOperation {
                    self.fishImageView?.image = nil
                }
                print("error: \(error)")
            }
        }
    }
    func loadFishes() {
        let urlJSON = "https://www.fishwatch.gov/api/species"
        guard let fishInfoURL = URL(string: urlJSON) else { return }
        guard let contents = try? Data(contentsOf: fishInfoURL) else { return }
        let library = JSON(contents).arrayValue
        
        for fish in library {
            cookingFish.addFish(name: fish["Species Name"].stringValue,
                 protein: fish["Protein"].stringValue,
                 quote: fish["Quote"].stringValue,
                 fisheries: fish["NOAA Fisheries Region"].stringValue, pic: fish["Species Illustration Photo"]["src"].stringValue)
//            print("hello",fish["Species Illustration Photo"]["src"].stringValue)


        }
//        print("second fish",fishInfo.fishs[indexPath.row].name)
        print("fish count hellooo",cookingFish.fishs.count)

    }
}
