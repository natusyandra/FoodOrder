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
        let viewModel = CategoryViewModel(
            location: CategoryViewModel.LocationData(cityName: "", date: ""),
            categories: model.categories
        )
        view.setup(viewModel: viewModel)
    }
    
    func getCategories() {
        interactor.getCategories()
    }
}
