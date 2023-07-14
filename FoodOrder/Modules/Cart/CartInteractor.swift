//
//  CartInteractor.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation

protocol CartInteractorProtocol: AnyObject {
    
}

class CartInteractor {
    weak var presenter: CartPresenterProtocol!
    
    required init(presenter: CartPresenterProtocol) {
        self.presenter = presenter
    }
}
