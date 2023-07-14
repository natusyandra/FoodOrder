//
//  StackDetailProduct.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 14.07.2023.
//

import Foundation
import UIKit

struct ProductDetaiViewModel {
    let name: String
    let price: String
    let weight: String
    let description: String?
}

class ProductDetailStack: UIStackView {
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textAlignment = .left
        label.autoresizingMask = .flexibleHeight
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "303 р "
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "· 303 г"
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.textColor = .gray
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
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        //text как в figme
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
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
    
    public func setup(model: ProductDetaiViewModel) {
        nameLabel.text = model.name
        priceLabel.text = model.price
        weightLabel.text = model.weight
        descriptionLabel.text = model.description
        
        if model.description == nil {
            descriptionLabel.isHidden = true
        }
    }
}
