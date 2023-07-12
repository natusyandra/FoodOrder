//
//  CategoryViewController.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import UIKit

protocol CategoryViewProtocol: AnyObject {
    
}

class CategoryViewController: UIViewController, CategoryViewProtocol {
    
    var presenter: CategoryPresenterProtocol!
    let configurator: CategoryConfiguratorProtocol = CategoryConfigurator()
    
    let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.backgroundColor = .blue
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var categoryCollectionView: CategoryProductCollectionView = {
        let category = CategoryProductCollectionView()
//        category.delegate = self
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    private lazy var productCollectionView: ProductCollectionView = {
        let category = ProductCollectionView()
//        category.delegate = self
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configurator.configure(with: self)

        setupSubviews()
        setupConstraints()
        addSettingsNavigation()
    }

    func setupSubviews() {
        view.addSubview(categoryCollectionView)
        view.addSubview(productCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            categoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            categoryCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
//            categoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoryCollectionView.widthAnchor.constraint(equalToConstant: 10),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 35),
            categoryCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
            productCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            productCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            productCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 16),
            productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
    
    func addSettingsNavigation() {
        let menuBarItem = UIBarButtonItem(customView: profileButton)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 44).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        navigationItem.rightBarButtonItem = menuBarItem
        navigationItem.title = CategoryCollectionViewCell().categoryLabel.text
//        navigationController?.view.tintColor = UIColor.black
    }
}


