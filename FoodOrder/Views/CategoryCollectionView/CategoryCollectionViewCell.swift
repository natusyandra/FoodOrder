//
//  CategoryCollectionViewCell.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    private var categoryImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "food")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "KAtegor"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        contentView.backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryLabel)
        contentView.layer.cornerRadius = 10
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            categoryLabel.heightAnchor.constraint(equalToConstant: 50),
            categoryLabel.widthAnchor.constraint(equalToConstant: 191),
            categoryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            categoryImage.topAnchor.constraint(equalTo: topAnchor),
            categoryImage.leftAnchor.constraint(equalTo: leftAnchor),
            categoryImage.rightAnchor.constraint(equalTo: rightAnchor),
            categoryImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //    public func setup(model: CategoryCardViewModel) {
    //        let viewModel = CardCollectionViewModel(cellSize: model.productCardSize, products: model.products)
    //        categoryLabel.text = model.title
    ////        cardCollectionView.dataSource = model.products
    //        cardCollectionView.setup(viewModel: viewModel)
    //    }
}

