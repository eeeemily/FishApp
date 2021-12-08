//
//  HomeVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/7/21.
//


import UIKit

class HomeVC: UIViewController {
    let defaults = UserDefaults.standard

    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var showInstructionLabel: UILabel!
    
    @IBOutlet weak var onDarkModeSwitch: UISwitch!
    @IBOutlet weak var showInstructionSwitch: UISwitch!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showInstructionSwitch.isOn = defaults.bool(forKey: dShowInstruction)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("darkModeChanged"), object: nil)
        darkModeLabel.text = NSLocalizedString("Dark Mode", comment: "")
        showInstructionLabel.text = NSLocalizedString("Show Instruction", comment: "")
        self.view.backgroundColor = UIColor(named: "PrimaryColor")
//
//        if UserDefaults.standard.bool(forKey: dDarkMode) {
//            overrideUserInterfaceStyle = .dark
//            self.view.backgroundColor = UIColor(named: "PrimaryColor")
//        } else {
//            overrideUserInterfaceStyle = .light
//            self.view.backgroundColor = UIColor(named: "PrimaryColor")
//        }
    }
    @objc func notificationReceived() {
        if UserDefaults.standard.bool(forKey: dDarkMode) {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        
    }
    @IBAction func onDarkMode(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: dDarkMode)
    }
    @IBAction func onShownInstruction(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: dShowInstruction)
    }
}
