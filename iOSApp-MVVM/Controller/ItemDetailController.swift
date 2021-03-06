//
//  ItemDetailController.swift
//  iOSApp-MVVM
//
//  Created by Inaldo Ramos Ribeiro on 23/02/2020.
//  Copyright © 2020 Inaldo's Software Development. All rights reserved.
//

import UIKit

class ItemDetailController: UIViewController {
    
    var itemDetailViewModels = ItemDetailViewModel(itemDetail: ItemDetail.Detail)
    
    //var itemDetailViewModels = ItemDetailViewModel.self(itemDetail: ItemDetail.Detail) // .init(itemDetail: ItemDetail.Detail)
    
//    lazy var viewModel: ItemDetailViewModel = {
//        return ItemDetailViewModel(itemDetail: ItemDetail.Detail)
//    }()
////

//    lazy var viewModel: ItemDetailViewModel = {
//        return ItemDetailViewModel(itemDetail: ItemDetail.Detail)
//    }()
    
    /// The view displaying the item detail.
    private var itemDetailView = ItemDetailView()
    
    /// Variable to support the Scroll View feature
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupView()
        fetchData()
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchItemDetails { (itemDetail, error) in
            if let error = error {
                print("Failed to fetch items:", error)
                return
            }
            
            //guard let item = itemDetail else { return }
            
            self.itemDetailViewModels = itemDetail?.itemDetail.body
            
            //  items?.items.map({ return ItemViewModel(item: $0)}) ?? []
            
            //self.itemDetailViewModels = itemDetail.map({ return ItemDetailViewModel(itemDetail: $0.itemDetail)}) ?? ""
        }
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Item Detail"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    fileprivate func setupView() {
        
        view.backgroundColor = .white
        
        itemDetailView.frame = view.bounds
        itemDetailView.backgroundColor = .white
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = itemDetailView.bounds.size
        scrollView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        scrollView.addSubview(itemDetailView)
        view.addSubview(scrollView)
        
    }
    
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               