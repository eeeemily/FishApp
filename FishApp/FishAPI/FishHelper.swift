//
//  FishHelper.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/5/21.
//


import Foundation


enum BoredActivityHelperResult: Error {
    case Success(Activity)
    case Failure(Error)
}

class FishHelper{
    

    let fmpUrl = "https://www.boredapi.com/api/activity?type=education"
    
    private func getActivity(from data: Data) -> BoredActivityHelperResult {
        do {
            let decoder = JSONDecoder()
            let activity = try decoder.decode(Activity.self, from: data)
            return .Success(activity)
        } catch let error {
            return .Failure(error)
        }
    }
    
    private func fmpUrl(symbol: String) -> URL? {

//        var queryItems = [URLQueryItem]()
//        for (key, value) in parameters {
//            let item = URLQueryItem(name: key, value: value)
//            queryItems.append(item)
//        }

        guard var components = URLComponents(string: fmpUrl) else {
            return nil
        }

//        components.queryItems = queryItems
        return components.url
    }

    func fetchActivity(for symbol: String, completion: @escaping (BoredActivityHelperResult) -> Void) {
        

        if let url = fmpUrl(symbol: symbol){
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let activityData = data else {
                    if let err = error {
                        completion(.Failure(err))
                    }
                    return
                }
                completion(self.getActivity(from: activityData))
            }
            task.resume()
        }else{
//            completion(.Failure(URLError.BadURL as! Error))
        }
        

    }
}

