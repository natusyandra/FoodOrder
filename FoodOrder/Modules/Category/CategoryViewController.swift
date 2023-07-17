//
//  ViewController.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import UIKit

protocol CategoryViewProtocol: AnyObject {
    func setup(viewModel: CategoryViewModel)
}

class CategoryViewController: UIViewController, CategoryViewProtocol {
    
    var presenter: CategoryPresenterProtocol!
    let configurator: CategoryConfiguratorProtocol = CategoryConfigurator()
    
    private lazy var navigationBar: NavigationBarView = {
        let bar = NavigationBarView()
        return bar
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        view.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    var dataSource: [CategoryModel.Category] = []
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurator.configure(with: self)
        setupSubviews()
        setupConstraints()
        presenter.getCategories()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = navigationBar
    }
    
    func setupSubviews() {
        view.addSubview(categoryCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            categoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            categoryCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            categoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoryCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
    func setup(viewModel: CategoryViewModel) {
        dataSource = viewModel.categories
        categoryCollectionView.reloadData()
    }
}

extension CategoryViewController: CategoryCollectionViewProtocol {
    func selectItem(_ index: Int) {
        presenter.selectItem(index)
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as!
        CategoryCollectionViewCell
        cell.setup(category: dataSource[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 148)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectItem(indexPath.row)
    }
}

