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
        image.image = UIImage(named: "product")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var favoritesButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
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
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var addToCartButton: UIButton = {
        let button = UIButton()
        button.titleLabel = "Добавить в корзину"
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        layer.masksToBounds = true
        addSubview(productImage)
        addSubview(closeButton)
        addSubview(favoritesButton)
        addSubview(nameLabel)
        addSubview(weightLabel)
        addSubview(descriptionLabel)
        addSubview(addToCartButton)
        
        backgroundColor = .green
        
        translatesAutoresizingMaskIntoConstraints = false

    }
    
    private func setupConstraints() {
       NSLayoutConstraint.activate([
        

        productImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        productImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
           
        productImage.widthAnchor.constraint(equalToConstant: 24),
        productImage.heightAnchor.constraint(equalToConstant: 24),
           
        productImage.widthAnchor.constraint(equalToConstant: 44),
        productImage.heightAnchor.constraint(equalToConstant: 44),
       ])
   }
}
