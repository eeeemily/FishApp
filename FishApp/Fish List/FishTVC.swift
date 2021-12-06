//
//  FishTVC.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation
import UIKit

class FishTVC: UITableViewController {
    var fishInfo: FishInfo!

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
//        readData()
//        getAPIData()
//    }
//    var arrData = [results]()
//    func getAPIData(){
////        let urlJSON = ""
//        let urlJSON = "https://www.fishwatch.gov/api/species"
//                    guard let url = URL(string: urlJSON) else {return}
//                    URLSession.shared.dataTask(with: url) { (data, response, error) in
//                        guard let data = data else {return}
//                        guard error == nil else {return}
//                        do {
//                            let decoder = JSONDecoder()
//                            let APIResponse = try decoder.decode(FishResults.self, from: data)
//                            self.arrData = APIResponse.results
//                            DispatchQueue.main.async{
//                                self.resultsTable.reloadData()
//                            }
//
//                        } catch let error {
//                            print("Failed to decode JSON:", error)
//                        }
//                    }.resume()
//                }
//    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return GenreType.allCases.count
//    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let genre = GenreType(rawValue: section) {
//            return reviews.games(for: genre).count
//        }
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return GenreType(rawValue: section)?.title()
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
            fatalError("Expected UITableViewCell")
        }

//        if let entry = fishInfo[indexPath.row] {
//            cell.update(fishInfo.fishs.self.)
//            
//        }
//        
        return cell
    }
}
