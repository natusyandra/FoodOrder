//
//  CartRouter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation

protocol CartRouterProtocol: AnyObject {
    
}

class CartRouter: CartRouterProtocol {
    
    weak var viewController: CartViewController!
    
    init(viewController: CartViewController) {
        self.viewController = viewController
    }
}
