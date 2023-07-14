//
//  CartPresenter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation

protocol CartPresenterProtocol: AnyObject {
    var router: CartRouterProtocol! { set get }
}

class CartPresenter: CartPresenterProtocol {
    
    weak var view: CartViewProtocol!
    var interactor: CartInteractorProtocol!
    var router: CartRouterProtocol!
    
    required init(view: CartViewProtocol) {
        self.view = view
    }
}
