//
//  CartCollectionView.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//
import Foundation
import UIKit

protocol CartCollectionViewProtocol: AnyObject {
    func selectItem(_ index: Int)
}

class CartCollectionView: UIView {
    
    private lazy var cartCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: CartCollectionViewCell.identifier)
        view.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    public var delegate: CartCollectionViewProtocol?
    
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
        addSubview(cartCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cartCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cartCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            cartCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            cartCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

extension CartCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        //        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCollectionViewCell.identifier, for: indexPath) as!
        CartCollectionViewCell
        //        cell.setup(model: dataSource[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 62)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectItem(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}


