//
//  ProductCollectionViewCell.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation
import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    
    private var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "eda")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        return image
    }()
    public var productLabel: UILabel = {
        let label = UILabel()
        label.text = "Блаблfffff"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.addSubview(productImage)
        contentView.addSubview(productLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            productImage.heightAnchor.constraint(equalToConstant: 109),
            productImage.widthAnchor.constraint(equalToConstant: 109),
//            productImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
//            productImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            productImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            productLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 5),
            productLabel.leftAnchor.constraint(equalTo: leftAnchor),
            productLabel.rightAnchor.constraint(equalTo: rightAnchor),
            productLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //    public func setup(model: CategoryCardViewModel) {
    //        let viewModel = CardCollectionViewModel(cellSize: model.productCardSize, products: model.products)
    //        categoryLabel.text = model.title
    ////        cardCollectionView.dataSource = model.products
    //        cardCollectionView.setup(viewModel: viewModel)
    //    }
}

