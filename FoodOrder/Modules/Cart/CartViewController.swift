//
//  CartViewController.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import UIKit

protocol CartViewProtocol: AnyObject {
    func setup(viewModel: CartViewModel)
    func selectItem(at index: Int)
}

class CartViewController: UIViewController, CartCollectionViewProtocol {
    
    var presenter: CartPresenterProtocol!
    let configurator: CartConfiguratorProtocol = CartConfigurator()
    
    private lazy var navigationBar: NavigationBarView = {
        let bar = NavigationBarView()
        return bar
    }()
    
    lazy var cartCollectionView: CartCollectionView = {
        let cart = CartCollectionView()
        cart.delegate = self
        cart.translatesAutoresizingMaskIntoConstraints = false
        return cart
    }()
    
    private var payButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить 1000000", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Pallete.blueColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var viewModel: CartViewModel?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurator.configure(with: self)
        view.layer.masksToBounds = true

        setupSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getCardItems()
    }
    
    
    func setupSubviews() {
        navigationItem.titleView = navigationBar
        view.addSubview(navigationBar)
        view.addSubview(cartCollectionView)
        view.addSubview(payButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            cartCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            cartCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            cartCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            cartCollectionView.bottomAnchor.constraint(equalTo: payButton.topAnchor, constant: 0),
            
            payButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            payButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            payButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            payButton.widthAnchor.constraint(equalToConstant: 311),
            payButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setup(viewModel: CartViewModel) {
        cartCollectionView.dataSource = viewModel.items
        self.viewModel = viewModel
    }
}

extension CartViewController: CartViewProtocol {
    func selectItem(at index: Int) {
        presenter.selectItem(at: index)
    }
}
