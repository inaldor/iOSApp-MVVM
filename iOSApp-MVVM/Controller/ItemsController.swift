//
//  ItemsController.swift
//  iOSApp-MVVM
//
//  Created by Inaldo Ramos Ribeiro on 22/02/2020.
//  Copyright © 2020 Inaldo's Software Development. All rights reserved.
//

import UIKit

class ItemsController: UITableViewController {
    
    var itemViewModels = [ItemViewModel]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        fetchItems()
        fetchData()
    }
    
    fileprivate func fetchItems() {
        Service.shared.fetchItems { (items, error) in
            if let error = error {
                print("Failed to fetch items:", error)
                return
            }
            
            self.itemViewModels = items?.items.map({ return ItemViewModel(item: $0)}) ?? []
        
            self.tableView.reloadData()
        }
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchItemDetails { (itemDetail, error) in
            if let error = error {
                print("Failed to fetch items:", error)
                return
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemCell
        let itemViewModel = itemViewModels[indexPath.row]
        cell.itemViewModel = itemViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemCell
        
        let itemDetailController = ItemDetailController()
        navigationController?.pushViewController(itemDetailController, animated: true)
        
    }
    
    fileprivate func setupTableView() {
        tableView.register(ItemCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Items"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 