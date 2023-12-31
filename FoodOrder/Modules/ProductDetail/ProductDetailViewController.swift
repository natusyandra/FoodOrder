//
//  ProductViewController.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.

import UIKit

protocol ProductDetailViewProtocol: AnyObject {
    func setup(viewModel: ProductsViewModel.Product)
    func close()
}

class ProductDetailViewController: UIViewController {
    
    private lazy var detailView: ProductDetailView = {
        let product = ProductDetailView()
        product.layer.cornerRadius = 15
        product.translatesAutoresizingMaskIntoConstraints = false
        return product
    }()
    
    var presenter: ProductDetailPresenterProtocol!
    let configurator: ProductDetailConfiguratorProtocol = ProductDetailConfigurator()
    
    // MARK: - Lifecycle methods
    
    init(product: ProductsModel.Product) {
        super.init(nibName: nil, bundle: nil)
        configurator.configure(with: self)
        presenter.setup(model: product)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.4)
        
        setupSubviews()
        setupConstraints()
        
        detailView.closeButton.addTarget(self,
                                         action: #selector(closeButtonTaped),
                                         for: .touchUpInside)
        detailView.addToCartButton.addTarget(self,
                                             action: #selector(tapAddToCartButton),
                                             for: .touchUpInside)
    }
    
    func setupSubviews() {
        view.addSubview(detailView)
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(closeButtonTaped))
        //        view.addGestureRecognizer(tap)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            detailView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            detailView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            detailView.widthAnchor.constraint(equalToConstant: 343),
            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func closeButtonTaped() {
        dismiss(animated: true)
    }
    
    @objc func tapAddToCartButton() {
        presenter.addToCart()
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol {
    func close() {
        dismiss(animated: true)
    }
    
    
    func setup(viewModel: ProductsViewModel.Product) {
        detailView.parametersLabelsVStackView.setup(viewModel: viewModel)
        detailView.productImage.downloadImage(urlString: viewModel.imageUrl)
    }
}

