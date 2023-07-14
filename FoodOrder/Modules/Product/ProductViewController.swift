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
    
    private lazy var productDetailView: ProductDetailView = {
        let product = ProductDetailView()
        //        product.delegate = self
        product.layer.cornerRadius = 15
        product.translatesAutoresizingMaskIntoConstraints = false
        return product
    }()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.4)
        configurator.configure(with: self)
        
        setupSubviews()
        setupConstraints()
        
        productDetailView.closeButton.addTarget(self,
                                          action: #selector(closeButtonTaped),
                                          for: .touchUpInside)
        closeButtonTaped()
    }
    
    func setupSubviews() {
        view.addSubview(productDetailView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeButtonTaped))
        view.addGestureRecognizer(tap)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productDetailView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            productDetailView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            productDetailView.widthAnchor.constraint(equalToConstant: 343),
            productDetailView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func closeButtonTaped() {
        dismiss(animated: true)
    }
}

