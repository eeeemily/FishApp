//
//  ImageHelper.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/6/21.
//

import Foundation
import UIKit


enum ImageHelperResult {
    case Success(UIImage)
    case Failure(Error)
}

class ImageHelper {
    
    func fetchImage(url: String, completion: @escaping (ImageHelperResult) -> Void) {
        
        if let url = URL(string: url) {
            
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { data, _, error in
                guard let imageData = data, let image = UIImage(data: imageData) else {
                    if let err = error {
                        completion(.Failure(err))
                    }
                    return
                }
                completion(.Success(image))
            }
            task.resume()
            
        } else {
            completion(.Failure(URLError.BadURL))
        }
    }
}
