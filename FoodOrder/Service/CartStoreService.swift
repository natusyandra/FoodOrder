//
//  CartStoreService.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 16.07.2023.
//

import Foundation

struct CartItemModel {
    var count: Int
    let product: ProductsModel.Product
}

struct CartItemViewModel {
    var count: Int
    let product: ProductsViewModel.Product
}

class CartStoreService {
    
    static let shared = CartStoreService()
    
    var items: [CartItemModel] = []
    
    func addToCart(product: ProductsModel.Product) {
        if let index = items.firstIndex(where: { item in
            return item.product.id == product.id
        }) {
            items[index].count += 1
        } else {
            items.append(CartItemModel(count: 1, product: product))
        }
    }
    
    func increaseItem(index: Int) {
        items[index].count += 1
    }
    
    func decreaseItem(index: Int) {
        items[index].count -= 1
        if items[index].count == 0 {
            items.remove(at: index)
        }
    }
}
