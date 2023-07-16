//
//  ProductConfigurator.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductDetailConfiguratorProtocol: AnyObject {
    func configure(with viewController: ProductDetailViewController)
}

class ProductDetailConfigurator: ProductDetailConfiguratorProtocol {
    func configure(with viewController: ProductDetailViewController) {
        let presenter = ProductDetailPresenter(view: viewController)
        let interactor = ProductDetailInteractor(presenter: presenter)
        let router = ProductDetailRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor as? any ProductDetailInteractorProtocol
        presenter.router = router
    }
}
