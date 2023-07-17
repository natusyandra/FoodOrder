//
//  CartInteractor.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation

protocol CartInteractorProtocol: AnyObject {
    func getCardItems()
}

class CartInteractor {
    weak var presenter: CartPresenterProtocol!
    
    let geocoderService = GeocoderService()
    
    required init(presenter: CartPresenterProtocol) {
        self.presenter = presenter
        startGeoService()
    }
    
    private func startGeoService() {
        geocoderService.run { [weak self] cityName in
            let model = NavigationBarModel(cityName: cityName)
            self?.presenter.response(model: model)
        }
    }
}

extension CartInteractor: CartInteractorProtocol {
    
    func getCardItems() {
            
        let items = CartStoreService.shared.items
 
        let model = CartModel(items: items)
        presenter.response(model: model)
    }
}

