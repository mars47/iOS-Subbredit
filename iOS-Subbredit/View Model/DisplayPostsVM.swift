//
//  DisplayPostsVM.swift
//  iOS-Subbredit
//
//  Created by Omar  on 23/07/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import Foundation

class DisplayPostsVM: NSObject {
    
    var postArray = Bindable([Post]())
    var postCellVMArray: [PostCellVM]!
    let appServerClient : AppServerClient
    
    var tempArray = Bindable([Post]())
    var limit = 10
    var totalEnteries : Int?
    
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    func downloadReddits() {
        
        self.appServerClient.downloadReddits() { (result) in
            self.postArray.value = result
            self.postCellVMArray = self.postArray.value.compactMap{ PostCellVM(initWith: $0) }
            
            var index = 0
            while index < self.limit {
                self.tempArray.value.append(result[index])
                index = index + 1
            }
            
        }
        
    }

}
