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
        
//        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "tCell")
        
        tableView.delegate = self
        tableView.dataSource = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.postArray.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tCell", for: indexPath) as? PostCell {
            
            let cellViewModel = viewModel.postCellVMArray[indexPath.row]
            cell.assignViewModel(viewModel: cellViewModel)
            return cell
        }
        return UITableViewCell()
    }


}

