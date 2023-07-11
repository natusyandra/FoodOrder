//
//  MainRouter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation

protocol MainRouterProtocol: AnyObject {
}

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
}
