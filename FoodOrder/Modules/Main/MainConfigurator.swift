//
//  MainConfigurator.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation

protocol MainConfiguratorProtocol: AnyObject {
    func configure(with viewController: MainViewController)
}

class MainConfigurator: MainConfiguratorProtocol {
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor as? any MainInteractorProtocol
        presenter.router = router
    }
}
