//
//  FishTVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
// populate tv: https://www.codementor.io/@brettr/two-basic-ways-to-populate-your-uitableview-du107rsyx

import Foundation
import UIKit

class FishTVC: UITableViewController {
    var fishInfo: FishInfo!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String

    }

    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fishInfo.fishs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FishCell") as? FishCell else {
            fatalError("Expected FishCell")
        }

        cell.update(name: fishInfo.fishs[indexPath.row].name, protein: fishInfo.fishs[indexPath.row].protein , quote: fishInfo.fishs[indexPath.row].quote, fisheries: fishInfo.fishs[indexPath.row].fisheries, pic: fishInfo.fishs[indexPath.row].pic)

        return cell
    }
}
