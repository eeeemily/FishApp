//
//  FishingVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//
// cool animation: https://blog.devgenius.io/how-to-animate-your-images-in-swift-ios-swift-guide-64de30ea616b
// transition from one image to another https://programmingwithswift.com/animate-image-change-with-swift/
// interesting progress bar https://guides.codepath.com/ios/Animating-A-Sequence-of-Images
// another cool anim and transitionhttps://developer.apple.com/tutorials/swiftui/animating-views-and-transitions

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
//        redoButton.isHidden = true
//        fishingManImgView.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        UIView.animate(withDuration: 2.4, animations: {
//            self.randomFishImgView?.alpha = 1.0
//        })
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
//        randomFishImgView.isHidden = false
        fishingManImgView.isHidden = false

        fetchFish(urlString: fishInfo.randomFishPic())//seem to show a few fish before generating?
        randomFishImgView.isHidden = false
        animFish()//animation
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
    func animFish(){
        rotateMan()
        swimFish()
//        moveFish()
        
    }
    func rotateMan(){
        UIView.animate(withDuration: 0.7, animations: {
            self.fishingManImgView?.rotate(by: 0.5, with: CGPoint(x: 0, y: 0))
        })
        UIView.animate(withDuration: 0.7, animations: {
            self.fishingManImgView?.rotate(by: -0.5, with: CGPoint(x: -0.5, y: 0.5))
        }, completion: { _ in
        
            UIView.animate(withDuration: 0.7, animations: {
                self.fishingManImgView?.rotate(by: 0, with: CGPoint(x: -0.5, y: 0.5))
                
            }, completion: { _ in
               
            })
        })
    }
    func moveFish(){
        UIView.animate(withDuration: 2.0) {
  
            self.randomFishImgView.transform = CGAffineTransform(translationX: 0, y: -80)
        }
    }
    func swimFish(){ //+ right, - left
        UIView.animate(withDuration: 2.0) {
  
            self.randomFishImgView?.transform = CGAffineTransform(translationX: -200, y: 0)
            self.randomFishImgView?.transform = CGAffineTransform(translationX: 220, y: 0)
            self.randomFishImgView?.transform = CGAffineTransform(translationX: 50, y: 0)
        }
        
        
        UIView.animate(withDuration: 0.7, animations: {
            self.randomFishImgView?.transform = CGAffineTransform(translationX: 20, y: 20)
        }, completion: { _ in
        
            UIView.animate(withDuration: 0.5, animations: {
                self.randomFishImgView?.transform = CGAffineTransform(translationX: -10, y: 30)
                
            }, completion: { _ in
                UIView.animate(withDuration: 0.7, animations: {
                    self.randomFishImgView?.transform = CGAffineTransform(translationX: 20, y: 10)
                    
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.randomFishImgView?.transform = CGAffineTransform(translationX: 10, y: 3)
                        
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.3, animations: {
                            self.randomFishImgView?.transform = CGAffineTransform(translationX: -10, y: -2)
                            
                        }, completion: { _ in
                            UIView.animate(withDuration: 0.2, animations: {
                                self.randomFishImgView?.transform = CGAffineTransform(translationX: 8, y: 2)
                                
                            }, completion: { _ in
                                UIView.animate(withDuration: 1, animations: {
                                    self.randomFishImgView.transform = CGAffineTransform(translationX: -110, y: -100)
                                })
                            })
                        })
                    })
                })
            })
        })
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

