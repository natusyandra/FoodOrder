//
//  MainRouter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation
import UIKit

protocol CategoryRouterProtocol: AnyObject {
    func openProducts(with category: CategoryModel.Category)
    
}

class CategoryRouter: CategoryRouterProtocol {
    
    weak var viewController: CategoryViewController!
    
    init(viewController: CategoryViewController) {
        self.viewController = viewController
    }
    func openProducts(with category: CategoryModel.Category) {
        let nv = ProductsViewController()
        nv.category = category
        viewController.navigationController?.pushViewController(nv, animated: true)
        viewController.navigationItem.backBarButtonItem =
        UIBarButtonItem( title: "",
                         style: .plain,
                         target: nil,
                         action: nil)
        viewController.navigationController?.view.tintColor = UIColor.black
    }
}
