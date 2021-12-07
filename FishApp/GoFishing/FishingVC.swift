//
//  FishingVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import UIKit

class FishingVC: UIViewController {
    @IBOutlet weak var fisheriesPicker: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var askLabel: UILabel!
    @IBOutlet weak var randomFishImgView: UIImageView!
    @IBOutlet weak var redoButton: UIButton!
    @IBOutlet weak var fishingManImgView: UIImageView!
    var fishInfo: FishInfo!
    let imageHelper = ImageHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        redoButton.isHidden = true
        fishingManImgView.isHidden = true
    }
    
    func showFishes(index: Int){
        if let fisheriesRegion = FisheriesRegion(rawValue: index) {            fishInfo.fishes(for: fisheriesRegion.region())
        }
    }
    @IBAction func goButton(_ sender: Any) {
        askLabel.isHidden = true
        fisheriesPicker.isHidden = true
        goButton.isHidden = true

        var index: Int = fisheriesPicker.selectedRow(inComponent: 0)
        showFishes(index: index)
        randomFishImgView.isHidden = false
        fishingManImgView.isHidden = false

        fetchFish(urlString: fishInfo.randomFishPic())//seem to show a few fish before generating?
        randomFishImgView.isHidden = false
        redoButton.isHidden = false
    }
    
    @IBAction func redoButton(_ sender: Any) {
        askLabel.isHidden = false
        fisheriesPicker.isHidden = false
        goButton.isHidden = false
        redoButton.isHidden = true
        randomFishImgView.isHidden = true
        fishingManImgView.isHidden = true

    }
    
    func fetchFish(urlString: String){
        imageHelper.fetchImage(url: urlString) { result in
            switch result {
            case let .Success(image):
                OperationQueue.main.addOperation() {
                    self.randomFishImgView?.image = image
                }
            case let .Failure(error):
                OperationQueue.main.addOperation {
                    self.randomFishImgView?.image = nil
                }
                print("error: \(error)")
            }
        }
    }
}


extension FishingVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return FisheriesRegion.allCases.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return FisheriesRegion(rawValue: row)?.with()
//    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            var label = UILabel()
            if let v = view {
                label = v as! UILabel
            }
            label.font = UIFont (name: "Chalkboard SE Regular", size: 20)
            label.textColor = UIColor.white
            label.text =  FisheriesRegion(rawValue: row)?.region()
            label.textAlignment = .center

            return label
        }
}
