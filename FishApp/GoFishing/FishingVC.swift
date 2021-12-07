//
//  FishingVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import UIKit

class FishingVC: UIViewController {
    @IBOutlet weak var fisheriesPicker: UIPickerView!
    var fishInfo: FishInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showFishes(index: Int){
        //fish region
        if let fisheriesRegion = FisheriesRegion(rawValue: index) {
            print(fisheriesRegion.region())
        }
    }
    @IBAction func goButton(_ sender: Any) {
//        print(fisheriesPicker.selectedRow(inComponent: 0))
        var index: Int = fisheriesPicker.selectedRow(inComponent: 0)
        print(index)
        showFishes(index: index)
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
