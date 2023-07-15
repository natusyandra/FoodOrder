//
//  CategoryViewController.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import UIKit

protocol ProductsViewProtocol: AnyObject {
    func setup(viewModel: ProductsViewModel)
}

class ProductsViewController: UIViewController, ProductsViewProtocol {
    
    let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cat"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 22
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private lazy var productTagsCollectionView: ProductTagsCollectionView = {
        let category = ProductTagsCollectionView()
        category.delegate = self
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    private lazy var productCollectionView: ProductCollectionView = {
        let category = ProductCollectionView()
        category.delegate = self
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    var presenter: ProductsPresenterProtocol!
    let configurator: ProductsConfiguratorProtocol = ProductsConfigurator()
    
    public var category: CategoryModel.Category?
    
    private var viewModel: ProductsViewModel?
    
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurator.configure(with: self)
        
        setupSubviews()
        setupConstraints()
        addSettingsNavigation()
        
        presenter.getProducts()
    }
    
    func setupSubviews() {
        view.addSubview(productTagsCollectionView)
        view.addSubview(productCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            productTagsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            productTagsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            productTagsCollectionView.widthAnchor.constraint(equalToConstant: 10),
            productTagsCollectionView.heightAnchor.constraint(equalToConstant: 35),
            productTagsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
            productCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            productCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            productCollectionView.topAnchor.constraint(equalTo: productTagsCollectionView.bottomAnchor, constant: 0),
            productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func setup(viewModel: ProductsViewModel) {
        productTagsCollectionView.dataSource = viewModel.tags
        productCollectionView.dataSource = viewModel.product
        self.viewModel = viewModel
    }
    
    func addSettingsNavigation() {
        let menuBarItem = UIBarButtonItem(customView: profileButton)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 44).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        navigationItem.rightBarButtonItem = menuBarItem
        navigationItem.title = category?.name
    }
}

extension ProductsViewController: ProductCollectionViewProtocol {
    func selectProduct(_ index: Int) {
        let vc = ProductViewController()
        vc.modalPresentationStyle = .overFullScreen
        navigationController?.present(vc, animated: true)
    }
}

extension ProductsViewController: ProductTagsCollectionViewProtocol {
    func selectTag(_ index: Int) {
        guard let viewModel = self.viewModel else {return}
        let tag = viewModel.tags[index]
        let filterProduct = viewModel.product.filter { item in
            return item.tags.contains(tag.value)
        }
        productCollectionView.dataSource = filterProduct
    }
}


