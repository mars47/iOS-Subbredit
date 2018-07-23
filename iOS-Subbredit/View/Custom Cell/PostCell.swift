//
//  PostCell.swift
//  iOS-Subbredit
//
//  Created by Omar  on 23/07/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var created: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var selftext: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
//        let screenWidth = UIScreen.main.bounds.size.width
//        widthConstraint.constant = screenWidth
//    }
    
    
    var viewModel: PostCellVM! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        
        DispatchQueue.main.async {
            
            self.created.text = "\(self.viewModel.post.created)"
            self.title.text = self.viewModel.post.title
            self.selftext.text = self.viewModel.post.selftext
            
        }
    }
    
    func assignViewModel(viewModel: PostCellVM) {
        self.viewModel = viewModel
    }
    
}
