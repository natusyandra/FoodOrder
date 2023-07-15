//
//  ProductRouter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductRouterProtocol: AnyObject {

}

class ProductRouter: ProductRouterProtocol {
    
    weak var viewController: ProductViewController!
    
    init(viewController: ProductViewController) {
        self.viewController = viewController
    }    
}
