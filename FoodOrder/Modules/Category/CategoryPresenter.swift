//
//  File.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation

protocol CategoryPresenterProtocol: AnyObject {
    var router: CategoryRouterProtocol! { set get }
    
    func response(model: CategoryModel)
    func response(model: NavigationBarModel)
    func selectItem(_ index: Int)
    func getCategories()
}

class CategoryPresenter: CategoryPresenterProtocol {
    
    weak var view: CategoryViewProtocol!
    var interactor: CategoryInteractorProtocol!
    var router: CategoryRouterProtocol!
    
    private var model: CategoryModel?
    
    required init(view: CategoryViewProtocol) {
        self.view = view
    }
    
    func response(model: CategoryModel) {
        self.model = model
        let viewModel = CategoryViewModel(categories: model.categories)
        view.setup(viewModel: viewModel)
    }
    
    func response(model: NavigationBarModel) {
        let viewModel = NavigationBarUseCases().map(model: model)
        view.setup(viewModel: viewModel)
    }
    
    func selectItem(_ index: Int) {
        guard let model = model else { return }
        router.openProducts(with: model.categories[index])
    }
    
    func getCategories() {
        interactor.getCategories()
    }
}
