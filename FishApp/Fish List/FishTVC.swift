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
//        readData()
//        getAPIData()
    }
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
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
//            fatalError("Expected UITableViewCell")
//        }

//        if let entry = fishInfo[indexPath.row] {
//            cell.update(fishInfo.fishs.self.)
//            
//        }
//        
//        return cell
//    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FishCell", for: indexPath) as! FishCell
        
        //no error but not populating the table
//        if let fish = fishInfo?.getFishs()[indexPath.row] as? Fish{
//            cell.update(name: fish.name, biology: fish.protein, habitat: fish.quote, fisheries: fish.fisheries)
//        }
        
        //populate the table with only text label?
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FishCell") as? FishCell else {
            fatalError("Expected FishCell")
        }
//        cell.textLabel?.text = "test"
        
        cell.update(name: fishInfo.fishs[indexPath.row].name, protein: fishInfo.fishs[indexPath.row].protein , quote: fishInfo.fishs[indexPath.row].quote, fisheries: fishInfo.fishs[indexPath.row].fisheries)

//        print(fishInfo.fishs[1].name)
        
        
        
        
//        cell.textLabel?.text = "fishInfo.fishs[indexPath.row].name"
//        cell.nameLabel.text

//        let fish = fishInfo.getFishs()[indexPath.row]
//        cell.update(name: "String", biology: "String",habitat:"String",fisheries:"String")
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FishCell") as? FishCell else {
//            fatalError("Expected FishCell")
//        }
        
//        if let fish = fishInfo[indexPath.row] as? Fish {
//            cell.update(with: fish)
//
//        }
//        cell.nameLabel?.text = "fishInfo[indexPath.row].name"
        //                cell.nameLabel?.text = "fishInfo[indexPath.row].name"
        //                tableView.reloadData()
        return cell
    }
}
