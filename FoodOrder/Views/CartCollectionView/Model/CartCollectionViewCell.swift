//
//  CartCollectionViewCell.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation
import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    static let identifier = "CartCollectionViewCell"
    
    private var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "eda")
        image.backgroundColor = Pallete.backgroundColorImage
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        return image
    }()
    
    private var minusLabel: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .black
        button.sizeThatFits(CGSize(width: 25, height: 25))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var plusLabel: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    lazy var priceLabelsHStackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [priceLabel, weightLabel])
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.alignment = .center
//        stack.distribution = .fillProportionally
//        stack.spacing = 0
//        return stack
//    }()
    
    lazy var parametersLabelsVStackView: ProductDetailStack = {
        let stack = ProductDetailStack()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var buttonsHStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [minusLabel, countLabel, plusLabel])
        stack.layer.cornerRadius = 10
        stack.backgroundColor = Pallete.backgroundColorButton
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 0
        return stack
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(productImage)
        contentView.addSubview(minusLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(plusLabel)
        contentView.addSubview(parametersLabelsVStackView)
        contentView.addSubview(buttonsHStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            productImage.heightAnchor.constraint(equalToConstant: 62),
            productImage.widthAnchor.constraint(equalToConstant: 62),
            productImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            
            parametersLabelsVStackView.leftAnchor.constraint(equalTo: productImage.rightAnchor, constant: 8),
            parametersLabelsVStackView.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            parametersLabelsVStackView.rightAnchor.constraint(equalTo: buttonsHStackView.leftAnchor, constant: -40),
            
            buttonsHStackView.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            buttonsHStackView.widthAnchor.constraint(equalToConstant: 99),
            buttonsHStackView.heightAnchor.constraint(equalToConstant: 32),
            buttonsHStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ])
    }
    
    //    public func setup(model: CategoryCardViewModel) {
    //        let viewModel = CardCollectionViewModel(cellSize: model.productCardSize, products: model.products)
    //        categoryLabel.text = model.title
    ////        cardCollectionView.dataSource = model.products
    //        cardCollectionView.setup(viewModel: viewModel)
    //    }
}

