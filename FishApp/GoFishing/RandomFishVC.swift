//
//  RandomFish.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//


import UIKit

class RandomFishVC: UIViewController {
    @IBOutlet weak var RandomFishIMg: UIImageView!
    let imageHelper = ImageHelper()
    let fishInfo = FishInfo()
    let fishingVC = FishingVC()
    override func viewDidLoad() {
        super.viewDidLoad()
//        //nil
//        fishInfo.fishes(for: "Alaska")
//        print(fishInfo.fishes(for: "Alaska").randomElement()?.pic)
//        print("hey",fishingVC.fishInfo?.randomFishPic())
        if(fishInfo.chosenFishes.count>0){
            fetchFish(urlString: fishInfo.randomFishPic())
            print("random pic url",fishInfo.randomFishPic())
        }
//        RandomFishIMg = randomFishPic
//        print(randomFishPic)
    }
    func fetchFish(urlString: String){
        imageHelper.fetchImage(url: urlString) { result in
            switch result {
            case let .Success(image):
                OperationQueue.main.addOperation() {
                    self.RandomFishIMg?.image = image
                }
            case let .Failure(error):
                OperationQueue.main.addOperation {
                    self.RandomFishIMg?.image = nil
                }
                print("error: \(error)")
            }
        }
    }
}
