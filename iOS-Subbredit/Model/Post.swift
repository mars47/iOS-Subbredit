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
    
    let date = Date()
    private (set) var title: String
    private (set) var author: String
    private (set) var url: String
    private (set) var created: Int
    private (set) var timeAgo: String
    private (set) var selftext: String
    private (set) var ups: Int
    private (set) var downs: Int
    
    
    init(initialisePostWith json:JSON) {
        title = json["title"].string!
        author = json["author"].string!
        url = json["url"].string!
        created = json["created"].int!
        timeAgo = date.timeAgoSinceDate(date.getDate(timestamp: Double(created)))
        selftext = json["selftext"].string!
        ups = json["ups"].int!
        downs = json["downs"].int!
    }
}
