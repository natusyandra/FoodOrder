//
//  CartModel.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 16.07.2023.
//

import Foundation

struct CartViewModel {
    var items: [CartItemViewModel]
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
        return CartViewModel(items: items)
    }
}



