//
//  CategoryRouter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductsRouterProtocol: AnyObject {
}

class ProductsRouter: ProductsRouterProtocol {
    
    weak var viewController: ProductsViewController!
    
    init(viewController: ProductsViewController) {
        self.viewController = viewController
    }
}
