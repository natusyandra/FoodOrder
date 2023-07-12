//
//  ProductCollectionView.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation
import UIKit

protocol ProductCollectionViewProtocol: AnyObject {
    func selectItem(_ index: Int)
}

class ProductCollectionView: UIView {
    
    private lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .yellow
        return view
    }()
    
    public var delegate: ProductCollectionViewProtocol?
    
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
        addSubview(productCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: topAnchor),
            productCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            productCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            productCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ProductCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
//        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as!
        ProductCollectionViewCell
//        cell.setup(model: dataSource[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.bounds.width/3.25
//        let height = width

        return CGSize(width: width, height: 144)
        
//        let width = collectionView.bounds.width
//        let height = dataSource[indexPath.row].productCardSize.height + 55
//        return CGSize(width: width, height: height)
//        return CGSize(width: width, height: 148)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectItem(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

}


