//
//  ProductInteractor.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductDetailInteractorProtocol: AnyObject {
    
}

class ProductDetailInteractor {
    weak var presenter: ProductDetailPresenterProtocol!
    
    required init(presenter: ProductDetailPresenterProtocol) {
        self.presenter = presenter
    }
}
