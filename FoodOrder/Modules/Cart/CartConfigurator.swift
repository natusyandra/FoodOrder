//
//  CartConfigurator.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation

protocol CartConfiguratorProtocol: AnyObject {
    func configure(with viewController: CartViewController)
}

class CartConfigurator: CartConfiguratorProtocol {
    func configure(with viewController: CartViewController) {
        let presenter = CartPresenter(view: viewController)
        let interactor = CartInteractor(presenter: presenter)
        let router = CartRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor as? any CartInteractorProtocol
        presenter.router = router
    }
}
