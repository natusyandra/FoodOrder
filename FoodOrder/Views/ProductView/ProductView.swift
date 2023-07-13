//
//  ProductView.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation
import UIKit

class ProductView: UIView {
    
    private var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "eda")
        image.backgroundColor = Pallete.backgroundColor
//        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.contentMode = .center
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var favoritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
//        button.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dis"), for: .normal)
//        button.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ffllffllfflflf"
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "303.404"
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "lfkffkfkfkfkfkfkfkfleepepdp pdfpdpede;p v;vppd"
        //text как в figme
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить в корзину", for: .normal)
        button.tintColor = .white
//        button.contentMode = .scaleAspectFit
        button.backgroundColor = Pallete.blueColor
        button.layer.cornerRadius = 10
//        button.layer.masksToBounds = true
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
        addSubview(nameLabel)
        addSubview(weightLabel)
        addSubview(descriptionLabel)
        addSubview(addToCartButton)
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

            nameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            weightLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            weightLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 62),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 311),
            
            addToCartButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            addToCartButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            addToCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            addToCartButton.widthAnchor.constraint(equalToConstant: 311),
            addToCartButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
