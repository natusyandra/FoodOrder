//
//  CategoryRouter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductsRouterProtocol: AnyObject {
    func openProductDetail(with product: ProductsModel.Product)
}

class ProductsRouter: ProductsRouterProtocol {
    
    weak var viewController: ProductsViewController!
    
    init(viewController: ProductsViewController) {
        self.viewController = viewController
    }
    
    func openProductDetail(with product: ProductsModel.Product) {
        let vc = ProductDetailViewController(product: product)
        vc.modalPresentationStyle = .overFullScreen
        viewController.navigationController?.present(vc, animated: true)
    }
    
}
