//
//  CartModel.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 16.07.2023.
//

import Foundation

struct CartViewModel {
    var items: [CartItemViewModel]
    var price: String
}

struct CartModel {
    var items: [CartItemModel]
}

class CartUseCases {
    func map(model: CartModel) -> CartViewModel {
        
        let items: [CartItemViewModel] = model.items.compactMap { item in
            var product = ProductUseCases().map(product: item.product)
            product.description = nil
            return CartItemViewModel(count: item.count, product: product)
        }
        let price = getTotalPrice(model: model)
        return CartViewModel(items: items, price: price)
    }
    
    func getTotalPrice(model: CartModel) -> String {
        var price = 0
        for item in model.items {
            price += item.product.price * item.count
        }
        if price == 0 {
            return ""
        }
        return "Оплатить \(price) ₽"
    }
}



