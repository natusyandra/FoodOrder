//
//  CategoryProductCollectionView.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation
import UIKit

protocol CategoryProductCollectionViewProtocol: AnyObject {
    func selectItem(_ index: Int)
}

class CategoryProductCollectionView: UIView {
    
    private lazy var categoryProductCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CategoryProductCollectionViewCell.self, forCellWithReuseIdentifier: CategoryProductCollectionViewCell.identifier)
        view.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    public var delegate: CategoryProductCollectionViewProtocol?
    
    //    public var dataSource: [CategoryCardViewModel] = [] {
    //        didSet {
    //            categoryCollectionView.reloadData()
    //        }
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(categoryProductCollectionView)
        categoryProductCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryProductCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryProductCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            categoryProductCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            categoryProductCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

extension CategoryProductCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        //        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryProductCollectionViewCell.identifier, for: indexPath) as!
        CategoryProductCollectionViewCell
        //        cell.setup(model: dataSource[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
//                let width = collectionView.bounds.width/2
        let width = (collectionView.bounds.width - 56)/3.7
        //        let height = dataSource[indexPath.row].productCardSize.height + 55
        //        return CGSize(width: width, height: height)
        return CGSize(width: width, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectItem(indexPath.row)
    }
}


