//
//  CategoryPresenter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductsPresenterProtocol: AnyObject {
    var router: ProductsRouterProtocol! { set get }
    func response(model: CategoryModel)
    func getCategories()
}

class ProductsPresenter: ProductsPresenterProtocol {
    
    weak var view: ProductsViewProtocol!
    var interactor: ProductsInteractorProtocol!
    var router: ProductsRouterProtocol!
    
    private var model: CategoryModel?
    
    required init(view: ProductsViewProtocol) {
        self.view = view
    }
    
    func response(model: CategoryModel) {
        self.model = model
        let viewModel = CategoryViewModel(
            categories: CategoryViewModel.CategoryProduct(name: "", teg: ""),
            product: model.products
        )
        view.setup(viewModel: viewModel)
    }
    
    func getCategories() {
        interactor.getProducts()
    }
}
