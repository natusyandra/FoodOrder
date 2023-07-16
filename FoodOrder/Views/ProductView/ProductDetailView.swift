//
//  ProductView.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation
import UIKit

class ProductDetailView: UIView {
    
    lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dishes")
        image.backgroundColor = Pallete.backgroundColorImage
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var favoritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dis"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var parametersLabelsVStackView: ProductDetailStack = {
        let stack = ProductDetailStack()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return stack
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить в корзину", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Pallete.blueColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        layer.masksToBounds = true
        addSubview(productImage)
        addSubview(favoritesButton)
        addSubview(closeButton)
        addSubview(parametersLabelsVStackView)
        addSubview(addToCartButton)
        parametersLabelsVStackView.spacing = 8
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            productImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            productImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            productImage.heightAnchor.constraint(equalToConstant: 232),
            productImage.widthAnchor.constraint(equalToConstant: 311),
            
            favoritesButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            favoritesButton.widthAnchor.constraint(equalToConstant: 40),
            favoritesButton.heightAnchor.constraint(equalToConstant: 40),
            favoritesButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -72),
            
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.leftAnchor.constraint(equalTo: favoritesButton.rightAnchor, constant: 8),
            
            parametersLabelsVStackView.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            parametersLabelsVStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            parametersLabelsVStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            parametersLabelsVStackView.bottomAnchor.constraint(equalTo: addToCartButton.topAnchor, constant: -16),
            
            addToCartButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            addToCartButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            addToCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            addToCartButton.widthAnchor.constraint(equalToConstant: 311),
            addToCartButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
