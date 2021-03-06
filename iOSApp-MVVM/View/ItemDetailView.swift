//
//  ItemDetailView.swift
//  iOSApp-MVVM
//
//  Created by Inaldo Ramos Ribeiro on 23/02/2020.
//  Copyright © 2020 Inaldo's Software Development. All rights reserved.
//

import UIKit

/// The view displaying the details of a single item.
class ItemDetailView: UIView {
    
    // MARK: Properties
    
    var itemDetailViewModel: ItemDetailViewModel! {
        didSet {
            titleLabel.text = itemDetailViewModel.title
            valueLabel.text = itemDetailViewModel.subTitle
            //detailTextLabel?.text = itemViewModel.subTitle
            //accessoryType = itemViewModel.date
        }
    }
    
    /// A vertical stack view containing multiple lines of labels do be displayed.
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.frame =  CGRect(x: 0, y: 0, width: 100, height: 100)
        return stackView
    }()
    
    /// The stack view containing the two horizontal labels.
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        return stackView
    }()
    
    /// The title label, displayed in the left.
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 35)
        
        return label
    }()
    
    /// The label displaying the value in the right.
    let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "value"
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 16)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 35)
        
        return label
    }()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View setup
    
    /// Initializes and configures each one of the subviews.
    private func setup() {
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(titleLabel)
        horizontalStackView.addArrangedSubview(valueLabel)
        
        
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                