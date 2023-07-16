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
        image.image = UIImage(named: "dishes")
        image.backgroundColor = Pallete.backgroundColorImage
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        return image
    }()
    
    private var minusButton: UIButton = {
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
        let count = 0
        label.text = "\(count)"
        label.textAlignment = .center
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var plusButton: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var parametersLabelsVStackView: ProductDetailStack = {
        let stack = ProductDetailStack()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var buttonsHStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [minusButton, countLabel, plusButton])
        stack.layer.cornerRadius = 10
        stack.backgroundColor = Pallete.backgroundColorButton
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 0
        return stack
    }()
    
    var productCount = 0
    public var index: Int = 0
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        productImage.image = UIImage(named: "dishes")
    }
    
    @objc func minusButtonPressed() {
        if productCount > 0 {
            productCount -= 1
            updateLabel()
        }
    }
    
    @objc func plusButtonPressed() {
        if productCount < 10 {
            productCount += 1
            updateLabel()
        }
    }
    
    func updateLabel() {
        countLabel.text = "\(productCount)"
    }
        
    private func setupSubviews() {
        contentView.addSubview(productImage)
        contentView.addSubview(minusButton)
        contentView.addSubview(countLabel)
        contentView.addSubview(plusButton)
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
    
    public func setup(item: CartItemViewModel) {
        downloadImage(urlString: item.product.imageUrl)
        parametersLabelsVStackView.setup(viewModel: item.product)
//        parametersLabelsVStackView.nameLabel.text = items.product.name
//        parametersLabelsVStackView.weightLabel.text = items.product.weight
//        parametersLabelsVStackView.priceLabel.text = items.product.price
    }
    
    private func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.productImage.image = UIImage(data: data)
            }
        }
        
        task.resume()
    }
    
    //    public func setup(model: CategoryCardViewModel) {
    //        let viewModel = CardCollectionViewModel(cellSize: model.productCardSize, products: model.products)
    //        categoryLabel.text = model.title
    ////        cardCollectionView.dataSource = model.products
    //        cardCollectionView.setup(viewModel: viewModel)
    //    }
}

