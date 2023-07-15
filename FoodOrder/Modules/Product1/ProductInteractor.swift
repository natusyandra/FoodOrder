//
//  ProductInteractor.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductInteractorProtocol: AnyObject {
    
}

class ProductInteractor {
    weak var presenter: ProductPresenterProtocol!
    
    required init(presenter: ProductPresenterProtocol) {
        self.presenter = presenter
    }
}
