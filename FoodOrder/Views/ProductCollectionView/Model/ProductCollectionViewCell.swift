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
        image.backgroundColor = Pallete.backgroundColorImage
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        return image
    }()
    public var productLabel: UILabel = {
        let label = UILabel()
        label.text = "Блаблfffffffffffffffffffffff"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 4
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
        contentView.addSubview(productImage)
        contentView.addSubview(productLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            productImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            productImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            productImage.heightAnchor.constraint(equalToConstant: 109),
            
            productLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 5),
            productLabel.leftAnchor.constraint(equalTo: leftAnchor),
            productLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    //    public func setup(model: CategoryCardViewModel) {
    //        let viewModel = CardCollectionViewModel(cellSize: model.productCardSize, products: model.products)
    //        categoryLabel.text = model.title
    ////        cardCollectionView.dataSource = model.products
    //        cardCollectionView.setup(viewModel: viewModel)
    //    }
}

