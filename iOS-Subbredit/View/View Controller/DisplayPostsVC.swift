//
//  ViewController.swift
//  iOS-Subbredit
//
//  Created by Omar  on 23/07/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class DisplayPostsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = DisplayPostsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 88
        bindViewModel()
        viewModel.downloadReddits()
    }
    
    func bindViewModel(){
        viewModel.postArray.bindAndFire() { [weak self] _ in
            DispatchQueue.main.async{
                self?.tableView?.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailVC {
            if let viewModel = sender as? PostCellVM {
                destination.viewModel = viewModel
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tempArray.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tCell", for: indexPath) as? PostCell {
            
            let cellViewModel = viewModel.postCellVMArray[indexPath.row]
            cell.assignViewModel(viewModel: cellViewModel)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        var limit : Int? // how much new items will be displayed
        let displayedPosts = viewModel.tempArray.value.count
        let allPosts = viewModel.postArray.value.count
        
        if (indexPath.row == displayedPosts - 1) && (displayedPosts < allPosts) {
            // if loading the last post AND if there are more posts to display
            
            var index = displayedPosts // record current number of displayed posts
            
            if 10 > allPosts - displayedPosts { // if less than 10 posts left to display
                limit = index + (allPosts - displayedPosts) // record how many
            } else {
                limit = index + 10 // else set display limit to 10 posts
            }
            
            if let limit = limit {
                
                while index < limit { // append 10 more items to array
                    viewModel.tempArray.value.append(viewModel.postArray.value[index])
                    index = index + 1
                }
                self.perform(#selector(loadTable), with: nil, afterDelay: 5)
            }
        }
    }

    @objc func loadTable() {
        self.tableView.reloadData()
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = self.viewModel.postCellVMArray[indexPath.row]
        performSegue(withIdentifier: "Show", sender: viewModel)
    }


}

