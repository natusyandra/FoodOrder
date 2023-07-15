//
//  CategoryModels.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 14.07.2023.
//

import UIKit

struct ProductsViewModel {

    let tags: [ProductsModel.ProductTag]
    let product: [ProductsModel.Product]
}

struct ProductsModel {
    
    struct Product {
        let id: Int
        let name: String
        let price: Int
        let weight: Int
        let description: String
        let image: String
        let tags: [String]
    }
    
    struct ProductTag {
        let value: String
    }
    
    let products: [ProductsModel.Product]
    let tags: [ProductsModel.ProductTag]
    
}

struct ProductResponseModel: Decodable {
    
    struct Dishes: Decodable {
        let id: Int
        let name: String
        let price: Int
        let weight: Int
        let description: String
        let imageUrl: String
        let tags: [String]
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case price
            case weight
            case description
            case imageUrl = "image_url"
            case tags = "tegs"
        }
    }
    
    let dishes: [ProductResponseModel.Dishes]
}

class ProductUseCases {
    func map(model: ProductResponseModel) -> ProductsModel {
        var setTags: Set<String> = []
        
        let products: [ProductsModel.Product] = model.dishes.compactMap { item in
            
            setTags = setTags.union(item.tags)

            return ProductsModel.Product(
                id: item.id,
                name: item.name,
                price: item.price,
                weight: item.weight,
                description: item.description,
                image: item.imageUrl,
                tags: item.tags)
        }
        var stringTags = setTags.sorted { $0 < $1 }
        let tags: [ProductsModel.ProductTag] = stringTags.compactMap { tag in
            return ProductsModel.ProductTag(value: tag)
        }
        return ProductsModel(products: products, tags: tags)
    }
}




