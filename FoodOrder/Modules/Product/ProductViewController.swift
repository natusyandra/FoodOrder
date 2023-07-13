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
        product.layer.cornerRadius = 15
        product.translatesAutoresizingMaskIntoConstraints = false
        return product
    }()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.4)
        //        view.backgroundColor = .blue
        configurator.configure(with: self)
        
        setupSubviews()
        setupConstraints()
        
        productView.closeButton.addTarget(self,
                                          action: #selector(closeButtonTaped),
                                          for: .touchUpInside)
        closeButtonTaped()
    }
    
    func setupSubviews() {
        view.addSubview(productView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeButtonTaped))
        view.addGestureRecognizer(tap)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            productView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            productView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 183),
            productView.heightAnchor.constraint(equalToConstant: 446),
            productView.widthAnchor.constraint(equalToConstant: 343),
            productView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            //
        ])
    }
    
    @objc func closeButtonTaped() {
        dismiss(animated: true)
    }
}
