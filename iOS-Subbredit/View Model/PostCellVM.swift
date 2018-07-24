//
//  PostCellVM.swift
//  iOS-Subbredit
//
//  Created by Omar  on 23/07/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

class PostCellVM: NSObject {
    
    let post: Post

    init(initWith post: Post) {
        
        self.post = post
        super.init()
    }
}
