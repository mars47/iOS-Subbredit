//
//  Post.swift
//  iOS-Subbredit
//
//  Created by Omar  on 23/07/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Post {
    
    private (set) var title: String
    private (set) var author: String
    private (set) var url: String
    private (set) var created: Int
    private (set) var selftext: String
    private (set) var ups: Int
    private (set) var downs: Int
    
    
    init(initialisePostWith json:JSON) {
        self.title = json["title"].string!
        self.author = json["author"].string!
        self.url = json["url"].string!
        self.created = json["created"].int!
        self.selftext = json["selftext"].string!
        self.ups = json["ups"].int!
        self.downs = json["downs"].int!
    }
}
