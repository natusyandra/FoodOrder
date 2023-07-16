//
//  CartPresenter.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation

protocol CartPresenterProtocol: AnyObject {
    var router: CartRouterProtocol! { set get }
    func response(model: CartModel)
//    func setup(model: CartModel)
    func getCardItems()
    func selectItem(at index: Int)
}

class CartPresenter: CartPresenterProtocol {
    
    weak var view: CartViewProtocol!
    var interactor: CartInteractorProtocol!
    var router: CartRouterProtocol!
    
    var model: CartModel?
    
    required init(view: CartViewProtocol) {
        self.view = view
    }
    
    func response(model: CartModel) {
        self.model = model
//        filterProducts = model.products
        let viewModel: CartViewModel = CartUseCases().map(model: model)
        view.setup(viewModel: viewModel)
    }
    
    func getCardItems() {
        interactor.getCardItems()
    }
    
    func selectItem(at index: Int) {
        guard let model = model else { return }
        let tag = model.tags[index]
        let filterProducts = model.products.filter { item in
            return item.tags.contains(tag.value)
        }
        self.filterProducts = filterProducts
        let filtredViewModelProducts = ProductUseCases().map(products: filterProducts)
        view.setup(products: filtredViewModelProducts)
    }
}
