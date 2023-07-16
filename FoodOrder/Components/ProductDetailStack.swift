//
//  StackDetailProduct.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 14.07.2023.
//

import Foundation
import UIKit

class ProductDetailStack: UIStackView {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textAlignment = .left
        label.autoresizingMask = .flexibleHeight
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "303 р "
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.textColor = Pallete.productPrice
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "· 303 г"
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.textColor = Pallete.productWeight
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabelsHStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [priceLabel, weightLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 0
        return stack
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        //text как в figme
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.textColor = Pallete.productDescriotion
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .systemBackground
        axis = .vertical
        alignment = .leading
        distribution = .fillProportionally
        spacing = 4
        setupSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addArrangedSubview(nameLabel)
        addArrangedSubview(priceLabelsHStackView)
        addArrangedSubview(descriptionLabel)
    }
    
    public func setup(viewModel: ProductsViewModel.Product) {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        weightLabel.text = viewModel.weight
        descriptionLabel.text = viewModel.description
        descriptionLabel.isHidden = viewModel.description == nil
    }
}
