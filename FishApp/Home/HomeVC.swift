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
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("darkModeChanged"), object: nil)
        self.view.backgroundColor = UIColor(named: "PrimaryColor")
//        self.urlInputTextField.backgroundColor = UIColor(named: "PrimaryColor")
//        self.urlInputTextField.textColor = UIColor.white
//        onDarkModeSwitch.isOn = defaults.bool(forKey: dDarkMode)
    }
    @objc func notificationReceived() {
        if UserDefaults.standard.bool(forKey: dDarkMode) {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        
    }
    @IBAction func onShownInstruction(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: dShowInstruction)
    }
}
