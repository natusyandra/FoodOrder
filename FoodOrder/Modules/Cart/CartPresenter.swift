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
    func getCardItems()
    func increaseItem(at index: Int)
    func decreaseItem(at index: Int)
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
        let viewModel: CartViewModel = CartUseCases().map(model: model)
        view.setup(viewModel: viewModel)
    }
    
    func getCardItems() {
        interactor.getCardItems()
    }
    
    func increaseItem(at index: Int) {
        model?.items[index].count += 1
        updatePrice()
        CartStoreService.shared.increaseItem(index: index)
    }
    
    func decreaseItem(at index: Int) {
        model?.items[index].count -= 1
        updatePrice()
        CartStoreService.shared.decreaseItem(index: index)
        if model?.items[index].count == 0 {
            interactor.getCardItems()
        }
    }
    
    private func updatePrice() {
        guard let model = model else { return }
        let price = CartUseCases().getTotalPrice(model: model)
        view.setupButtonTitle(title: price)
    }
}

