//
//  HomeVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/7/21.
//


import UIKit

class HomeVC: UIViewController {
    let defaults = UserDefaults.standard

    
    @IBOutlet weak var onDarkModeSwitch: UISwitch!
    @IBOutlet weak var showInstructionSwitch: UISwitch!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showInstructionSwitch.isOn = defaults.bool(forKey: dShowInstruction)
//        onDarkModeSwitch.isOn = defaults.bool(forKey: dDarkMode)
    }
    @IBAction func onShownInstruction(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: dShowInstruction)
    }
}
