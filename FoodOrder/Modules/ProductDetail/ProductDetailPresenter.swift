//
//  ProductPresenter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductDetailPresenterProtocol: AnyObject {
    var router: ProductDetailRouterProtocol! { set get }
    func setup(model: ProductsModel.Product)
    func addToCart()
}

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    weak var view: ProductDetailViewProtocol!
    var interactor: ProductDetailInteractorProtocol!
    var router: ProductDetailRouterProtocol!
    
    var model: ProductsModel.Product?
    
    required init(view: ProductDetailViewProtocol) {
        self.view = view
    }
    
    func setup(model: ProductsModel.Product) {
        self.model = model
        let viewModel: ProductsViewModel.Product = ProductUseCases().map(product: model)
        view.setup(viewModel: viewModel)
    }
    
    func addToCart() {
        guard let model = model else { return }
        CartStoreService.shared.addToCart(product: model)
        view.close()
    }
}
