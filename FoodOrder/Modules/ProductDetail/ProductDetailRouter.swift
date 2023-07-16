//
//  ProductRouter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductDetailRouterProtocol: AnyObject {

}

class ProductDetailRouter: ProductDetailRouterProtocol {
    
    weak var viewController: ProductDetailViewController!
    
    init(viewController: ProductDetailViewController) {
        self.viewController = viewController
    }    
}
