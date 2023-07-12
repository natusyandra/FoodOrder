//
//  ViewController.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    
}

class MainViewController: UIViewController, MainViewProtocol {
    
    var presenter: MainPresenterProtocol!
    let configurator: MainConfiguratorProtocol = MainConfigurator()
    
    private lazy var categoryCollectionView: CategoryCollectionView = {
        let category = CategoryCollectionView()
        category.delegate = self
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    private lazy var navigationBar: NavigationBarView = {
        let bar = NavigationBarView()
        return bar
    }()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configurator.configure(with: self)
        navigationItem.titleView = navigationBar
        
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(categoryCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            categoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            categoryCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            categoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoryCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
}

extension MainViewController: CategoryCollectionViewProtocol {
    func selectItem(_ index: Int) {
        let nv = CategoryViewController()
        navigationController?.pushViewController(nv, animated: true)
        navigationItem.backBarButtonItem =
        UIBarButtonItem( title: "",
                         style: .plain,
                         target: nil,
                         action: nil)
        navigationController?.view.tintColor = UIColor.black
    }
}

