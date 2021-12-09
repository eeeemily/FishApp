//
//  FishTVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
// tvc swipe action: https://programmingwithswift.com/uitableviewcell-swipe-actions-with-swift/

import Foundation
import UIKit

class FishTVC: UITableViewController {
    var fishInfo: FishInfo!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
        
        //dark mode
        self.view.backgroundColor = UIColor(named: "PrimaryColor")
        self.tableView.backgroundColor = UIColor(named: "SecondaryColor")

        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("darkModeChanged"), object: nil)

    }
    @objc func notificationReceived() {
        if UserDefaults.standard.bool(forKey: dDarkMode) {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: dShowInstruction) {
            let alert = UIAlertController(title: "Welcome to Fish App!", message: "You can learn about fishes here!🐟", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated:  true)
        }
    }
    //fav
    private func handleMarkAsFavourite() {
        print("Marked as favourite")
        deletionAlert(title: "hey", completion: { _ in
            print("hello?")
        })    }
    override func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Favourite") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsFavourite()
                                            completionHandler(true)
        }
        action.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [action])

    }
    override func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
//        let alertMsg = "Are you sure you want to save it as your favorite \(title)?"
        let alert = UIAlertController(title: NSLocalizedString("Is this your favorite fish?", comment: ""), message: nil, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: NSLocalizedString("Yes!", comment: ""), style: .default, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("No😅", comment: ""), style: .cancel)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fishInfo.fishs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FishCell") as? FishCell else {
            fatalError("Expected FishCell")
        }
        cell.backgroundColor = UIColor(named: "PrimaryColor")


        cell.update(name: fishInfo.fishs[indexPath.row].name, protein: fishInfo.fishs[indexPath.row].protein , quote: fishInfo.fishs[indexPath.row].quote, fisheries: fishInfo.fishs[indexPath.row].fisheries, pic: fishInfo.fishs[indexPath.row].pic)

        return cell
    }
}
