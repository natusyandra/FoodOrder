//
//  ProductViewController.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.

import UIKit

protocol ProductViewProtocol: AnyObject {
    
}

class ProductViewController: UIViewController, ProductViewProtocol {
    
    var presenter: ProductPresenterProtocol!
    let configurator: ProductConfiguratorProtocol = ProductConfigurator()
    
    private lazy var productView: ProductView = {
        let product = ProductView()
//        product.delegate = self
        product.translatesAutoresizingMaskIntoConstraints = false
        return product
    }()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurator.configure(with: self)

        setupSubviews()
        setupConstraints()
    }

    func setupSubviews() {
        view.addSubview(productView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([

//            productView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
//            productView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            productView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 183),
            productView.heightAnchor.constraint(equalToConstant: 446),
            productView.widthAnchor.constraint(equalToConstant: 343),
            productView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            productView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
//
        ])
    }
}



