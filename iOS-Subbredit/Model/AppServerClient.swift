//
//  AppServerClient.swift
//  iOS-Subbredit
//
//  Created by Omar  on 23/07/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AppServerClient: NSObject {
    
    var posts = [Post]()
    
    func downloadReddits(completion: @escaping  ([Post]) -> ()) {
        
        let url = URL(string: "https://www.reddit.com/r/ios/hot.json")
        var json : JSON?
        
        Alamofire.request(url!).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                json = JSON(value)
                
                for element in json!["data"]["children"].arrayValue {
                 let post = Post(initialisePostWith: element["data"])
                    self.posts.append(post)
                }
                completion(self.posts)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
