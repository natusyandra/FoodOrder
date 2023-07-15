//
//  CategoryConfigurator.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductsConfiguratorProtocol: AnyObject {
    func configure(with viewController: ProductsViewController)
}

class ProductsConfigurator: ProductsConfiguratorProtocol {
    func configure(with viewController: ProductsViewController) {
        let presenter = ProductsPresenter(view: viewController)
        let interactor = ProductsInteractor(presenter: presenter)
        let router = ProductsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor as? any ProductsInteractorProtocol
        presenter.router = router
    }
}
