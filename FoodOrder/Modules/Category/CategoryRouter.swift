//
//  MainRouter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation

protocol CategoryRouterProtocol: AnyObject {
}

class CategoryRouter: CategoryRouterProtocol {
    
    weak var viewController: CategoryViewController!
    
    init(viewController: CategoryViewController) {
        self.viewController = viewController
    }
}
