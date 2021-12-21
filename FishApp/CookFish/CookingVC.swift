//
//  CookingVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
// button get a random fish to cook
// by swipping!
// double click to cook
// long press to show fish info
//


import UIKit

class CookingVC: UIViewController {
    @IBOutlet weak var panImgView: UIImageView!
    @IBOutlet weak var containerImgView: UIImageView!
    @IBOutlet weak var fishImageView: UIImageView!
    @IBOutlet weak var cookingFishNameLabel: UILabel!
    @IBOutlet weak var cookingFishProteinLabel: UILabel!
    @IBOutlet weak var cookingFishRegionLabel: UILabel!
    @IBOutlet weak var longPressIcon: UIImageView!
    @IBOutlet var longPressLabel: UIView!
    //    var fishInfo: FishInfo!
    var cookingFish = FishInfo()
    var curFish: Fish!
    var prevFish: Fish!
    var fishingVC = FishingVC()
    let imageHelper = ImageHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFishes()
        curFish = fetchFishPicToCook()
        prevFish = fetchFishPicToCook()
        
        panImgView.isHidden = true
        cookingFishNameLabel.isHidden = true
        cookingFishProteinLabel.isHidden = true
        cookingFishRegionLabel.isHidden = true
        fetchFishPic(urlString: curFish.pic)
        
        //dark mode
        self.view.backgroundColor = UIColor(named: "PrimaryColor")

        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("darkModeChanged"), object: nil)

    }
    @objc func notificationReceived() {
        if UserDefaults.standard.bool(forKey: dDarkMode) {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }


    @IBAction func onHorizontalSwiipe(_ sender: UISwipeGestureRecognizer){
        switch sender.direction {
            case .left: //next
                hideFishInfo()
                prevFish = curFish
                curFish = fetchFishPicToCook()
                fetchFishPic(urlString: curFish.pic)
            case .right: //prev, future implementation: maybe can have prev few?
                if((prevFish?.name) != nil){ //if there's a prev fish
                    hideFishInfo()
                    curFish = prevFish
                    fetchFishPic(urlString: curFish.pic)
                }
            default: break
        }
    }
    func fetchFishPicToCook()->Fish{
        return cookingFish.fishs.randomElement()!
        
    }
    @IBAction func onFishInfo(_ sender: UILongPressGestureRecognizer) {
        cookingFishNameLabel.text = curFish.name
        cookingFishProteinLabel.text = "Protein: "+curFish.protein
        cookingFishRegionLabel.text = "Region: "+curFish.fisheries
        cookingFishNameLabel.isHidden = false
        cookingFishProteinLabel.isHidden = false
        cookingFishRegionLabel.isHidden = false
    }
    func showFishInfo(){
        longPressLabel.isHidden = true
        longPressIcon.isHidden = true
        cookingFishNameLabel.isHidden = false
        cookingFishProteinLabel.isHidden = false
        cookingFishRegionLabel.isHidden = false
    }
    func hideFishInfo(){
        longPressIcon.isHidden = false
        longPressLabel.isHidden = false
        cookingFishNameLabel.isHidden = true
        cookingFishProteinLabel.isHidden = true
        cookingFishRegionLabel.isHidden = true
    }
    func fetchFishPic(urlString: String){
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

        }

    }
}


