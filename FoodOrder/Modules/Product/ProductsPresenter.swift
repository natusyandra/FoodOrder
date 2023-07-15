//
//  CategoryPresenter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductsPresenterProtocol: AnyObject {
    var router: ProductsRouterProtocol! { set get }
    func response(model: ProductsModel)
    func getProducts()
}

class ProductsPresenter: ProductsPresenterProtocol {
    
    weak var view: ProductsViewProtocol!
    var interactor: ProductsInteractorProtocol!
    var router: ProductsRouterProtocol!
    
    private var model: ProductsModel?
    
    required init(view: ProductsViewProtocol) {
        self.view = view
    }
    
    func response(model: ProductsModel) {
        self.model = model
        let viewModel = ProductsViewModel(tags: model.tags, product: model.products)
        view.setup(viewModel: viewModel)
    }
    
    func getProducts() {
        interactor.getProducts()
    }
}
