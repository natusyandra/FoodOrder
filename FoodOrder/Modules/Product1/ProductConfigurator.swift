//
//  ProductConfigurator.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductConfiguratorProtocol: AnyObject {
    func configure(with viewController: ProductViewController)
}

class ProductConfigurator: ProductConfiguratorProtocol {
    func configure(with viewController: ProductViewController) {
        let presenter = ProductPresenter(view: viewController)
        let interactor = ProductInteractor(presenter: presenter)
        let router = ProductRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor as? any ProductInteractorProtocol
        presenter.router = router
    }
}
