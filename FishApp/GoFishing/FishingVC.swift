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
// remove all subView from View: https://stackoverflow.com/questions/24312760/how-to-remove-all-subviews-of-a-view-in-swift

import UIKit

class FishingVC: UIViewController {
    @IBOutlet weak var fisheriesPicker: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var askLabel: UILabel!
    @IBOutlet weak var randomFishImgView: UIImageView!
    @IBOutlet weak var redoButton: UIButton!
    @IBOutlet weak var fishingManImgView: UIImageView!
    @IBOutlet var fishingFishLabel: UILabel!
    @IBOutlet var fishingFishProtein: UILabel!
    @IBOutlet weak var fishingFishRegion: UILabel!
    @IBOutlet weak var oceanView: UIView!
    var fishInfo: FishInfo!
    var randomFisheryFish: Fish!
    let imageHelper = ImageHelper()
    var curRanFish: Fish!
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
        hideFishInfo()
        redoButton.isHidden = true
        fishingManImgView.isHidden = true
        oceanView.isHidden = true
    }
    
    func showFishes(index: Int){
        if let fisheriesRegion = FisheriesRegion(rawValue: index) {
            fishInfo.fishes(for: fisheriesRegion.region())
            
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
        curRanFish = fishInfo.randomChosenFish()
        fetchFish(urlString: curRanFish.pic)//seem to show a few fish before generating?
        randomFishImgView.isHidden = false
        animFish()//animation
        redoButton.isHidden = false
        oceanView.isHidden = false
    }
    
    @IBAction func redoButton(_ sender: Any) {
        askLabel.isHidden = false
        fisheriesPicker.isHidden = false
        goButton.isHidden = false
        redoButton.isHidden = true
        randomFishImgView.isHidden = true
        fishingManImgView.isHidden = true
        hideFishInfo()
        oceanView.isHidden = true

        for view in oceanView.subviews {
            view.removeFromSuperview()
        }
    }
    func hideFishInfo(){
        fishingFishLabel.isHidden = true
        fishingFishProtein.isHidden = true
        fishingFishRegion.isHidden = true
    }
    func showFishInfo(){
        fishingFishLabel.isHidden = false
        fishingFishProtein.isHidden = false
        fishingFishRegion.isHidden = false
    }
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let url = URL(string: curRanFish.pic)
        let data = try? Data(contentsOf: url!)
//        imageView.image = UIImage(data: data!)
        let newFish = UIImageView(image: UIImage(data: data!))
        let height = 100/oceanView.frame.size.width * (newFish.image?.size.height)! //doesn't work tho?
        newFish.frame = CGRect(x: 0,y: 0,width: 120, height: height)
        newFish.center = CGPoint(x: sender.location(in: oceanView).x, y: sender.location(in: oceanView).y)

        //add the new view via transition
        UIView.transition(with: oceanView,
          duration: 0.33,
          options: [.curveEaseOut],
          animations: {
            self.oceanView.addSubview(newFish)
          },
          completion: nil
        )
    }
//    func fetchTapFishPic()->UIImageView{
//        let urlString = curRanFish.pic
//        imageHelper.fetchImage(url: urlString) { result in
//            switch result {
//            case let .Success(image):
//                return UIImageView(image: image)!
////                OperationQueue.main.addOperation() {
////
////                    self.randomFishImgView?.image = image
////                }
//            case let .Failure(error):
////                OperationQueue.main.addOperation {
////                    self.randomFishImgView?.image = nil
////                }
//                return UIImageView(image: UIImage(named: "logo"))!
//                print("error: \(error)")
//            }
//        }
//    }
    @IBAction func onLongPress(_ sender: UILongPressGestureRecognizer) {
        fishingFishLabel.text = curRanFish.name
        fishingFishProtein.text = curRanFish.protein
        fishingFishRegion.text = curRanFish.fisheries
        showFishInfo()
        
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
            self.fishingManImgView?.rotate(by: 0.005, with: CGPoint(x: 0, y: 0))

        }, completion: { _ in
        
            UIView.animate(withDuration: 0.5, animations: {
                self.randomFishImgView?.transform = CGAffineTransform(translationX: -10, y: 30)
                self.fishingManImgView?.rotate(by: -0.005, with: CGPoint(x: 0, y: 0))

                
            }, completion: { _ in
                UIView.animate(withDuration: 0.7, animations: {
                    self.randomFishImgView?.transform = CGAffineTransform(translationX: 20, y: 10)
                    self.fishingManImgView?.rotate(by: 0.005, with: CGPoint(x: 0, y: 0))

                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.randomFishImgView?.transform = CGAffineTransform(translationX: 10, y: 3)
                        self.fishingManImgView?.rotate(by: -0.005, with: CGPoint(x: 0, y: 0))

                    }, completion: { _ in
                        UIView.animate(withDuration: 0.3, animations: {
                            self.randomFishImgView?.transform = CGAffineTransform(translationX: -10, y: -2)
                            self.fishingManImgView?.rotate(by: 0.005, with: CGPoint(x: 0, y: 0))

                        }, completion: { _ in
                            UIView.animate(withDuration: 0.2, animations: {
                                self.randomFishImgView?.transform = CGAffineTransform(translationX: 8, y: 2)
                                self.fishingManImgView?.rotate(by: -0.005, with: CGPoint(x: 0, y: 0))

                            }, completion: { _ in
                                UIView.animate(withDuration: 1, animations: {
                                    self.randomFishImgView.transform = CGAffineTransform(translationX: -110, y: -100)
                                    self.fishingManImgView?.rotate(by: 0.09, with: CGPoint(x: 0, y: 0))

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

