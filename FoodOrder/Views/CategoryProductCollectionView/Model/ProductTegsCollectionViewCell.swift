//
//  CategoryProductCollectionViewCell.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation
import UIKit

class ProductTegsCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryProductCollectionViewCell"
    
    public var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Сgggggggggggggggggалаты"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    var dataSource: [ProductsModel.ProductTag] = []
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        contentView.clipsToBounds = true
        contentView.addSubview(categoryLabel)
        contentView.layer.cornerRadius = 10
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            //            categoryLabel.heightAnchor.constraint(equalToConstant: 50),
            //            categoryLabel.widthAnchor.constraint(equalToConstant: 191),
            categoryLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            categoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
        ])
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                categoryLabel.textColor = .white
                contentView.backgroundColor = .blue
            } else {
                categoryLabel.textColor = .black
                contentView.backgroundColor = Pallete.backgroundColorImage
            }
        }
    }
    
    func setup(viewModel: ProductsModel.ProductTag) {
        dataSource = viewModel.categories
        categoryCollectionView.reloadData()
    }
    
    
}

