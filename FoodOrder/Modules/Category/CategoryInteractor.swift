//
//  CAtegoryInteractor.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol CategoryInteractorProtocol: AnyObject {
    
}

class CategoryInteractor {
    weak var presenter: CategoryPresenterProtocol!
    
    required init(presenter: CategoryPresenterProtocol) {
        self.presenter = presenter
    }
}
