//
//  CategoryProductCollectionViewCell.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation
import UIKit

class CategoryProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryProductCollectionViewCell"
    
    public var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Катsfp"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
//        label.layer.cornerRadius = 10
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.backgroundColor = .green
        contentView.clipsToBounds = true
        contentView.addSubview(categoryLabel)
        contentView.layer.cornerRadius = 10
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutConstraints() {
        NSLayoutConstraint.activate([
            
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//            categoryLabel.heightAnchor.constraint(equalToConstant: 50),
//            categoryLabel.widthAnchor.constraint(equalToConstant: 191),
            categoryLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            categoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
        ])
    }
    
    //    public func setup(model: CategoryCardViewModel) {
    //        let viewModel = CardCollectionViewModel(cellSize: model.productCardSize, products: model.products)
    //        categoryLabel.text = model.title
    ////        cardCollectionView.dataSource = model.products
    //        cardCollectionView.setup(viewModel: viewModel)
    //    }
}

