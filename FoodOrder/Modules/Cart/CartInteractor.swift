//
//  CartInteractor.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation

protocol CartInteractorProtocol: AnyObject {
    func getCardItems()
}

class CartInteractor {
    weak var presenter: CartPresenterProtocol!
    
    required init(presenter: CartPresenterProtocol) {
        self.presenter = presenter
    }
}

extension CartInteractor: CartInteractorProtocol {
    
    func getCardItems() {
            
        let items = CartStoreService.shared.items
 
        let model = CartModel(items: items)
        presenter.response(model: model)
    }
}

