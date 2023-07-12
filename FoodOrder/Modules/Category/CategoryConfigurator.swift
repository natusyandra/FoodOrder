//
//  CategoryConfigurator.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol CategoryConfiguratorProtocol: AnyObject {
    func configure(with viewController: CategoryViewController)
}

class CategoryConfigurator: CategoryConfiguratorProtocol {
    func configure(with viewController: CategoryViewController) {
        let presenter = CategoryPresenter(view: viewController)
        let interactor = CategoryInteractor(presenter: presenter)
        let router = CategoryRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor as? any CategoryInteractorProtocol
        presenter.router = router
    }
}
