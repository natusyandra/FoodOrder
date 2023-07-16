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
    func openProductDetails(at index: Int)
    func selectTag(at index: Int)
}

class ProductsPresenter: ProductsPresenterProtocol {
    
    weak var view: ProductsViewProtocol!
    var interactor: ProductsInteractorProtocol!
    var router: ProductsRouterProtocol!
    
    private var model: ProductsModel?
    private var filterProducts: [ProductsModel.Product] = []
    
    required init(view: ProductsViewProtocol) {
        self.view = view
    }
    
    func response(model: ProductsModel) {
        self.model = model
        filterProducts = model.products
        let viewModel: ProductsViewModel = ProductUseCases().map(model: model)
        view.setup(viewModel: viewModel)
    }
    
    func getProducts() {
        interactor.getProducts()
    }
    
    func openProductDetails(at index: Int) {
        let product = filterProducts[index]
        router.openProductDetail(with: product)
    }
    
    func selectTag(at index: Int) {
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
