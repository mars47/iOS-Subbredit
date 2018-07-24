//
//  PostCell.swift
//  iOS-Subbredit
//
//  Created by Omar  on 23/07/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var timeAgo: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var selftext: UILabel!

    var viewModel: PostCellVM! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        
        DispatchQueue.main.async {
            
           self.timeAgo.text = "Posted by \(self.viewModel.post.author) \(self.viewModel.post.timeAgo)"
           self.title.text = self.viewModel.post.title
           self.selftext.text = self.viewModel.post.selftext
        }
    }
    
    func assignViewModel(viewModel: PostCellVM) {
        self.viewModel = viewModel
    }
    
}
