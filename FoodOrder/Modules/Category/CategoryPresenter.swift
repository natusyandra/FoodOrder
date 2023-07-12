//
//  CategoryPresenter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol CategoryPresenterProtocol: AnyObject {
    var router: CategoryRouterProtocol! { set get }
    
    func loadData()
    
}

class CategoryPresenter: CategoryPresenterProtocol {
    
    weak var view: CategoryViewProtocol!
    var interactor: CategoryInteractorProtocol!
    var router: CategoryRouterProtocol!
    
    required init(view: CategoryViewProtocol) {
        self.view = view
    }
    
    func loadData() {
        
    }
}
