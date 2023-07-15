//
//  ProductPresenter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductPresenterProtocol: AnyObject {
    var router: ProductRouterProtocol! { set get }
}

class ProductPresenter: ProductPresenterProtocol {
    
    weak var view: ProductViewProtocol!
    var interactor: ProductInteractorProtocol!
    var router: ProductRouterProtocol!
    
    required init(view: ProductViewProtocol) {
        self.view = view
    }
}
