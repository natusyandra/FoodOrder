//
//  MainModels.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 14.07.2023.
//

import UIKit

struct CategoryViewModel {
    let categories: [CategoryModel.Category]
}

struct CategoryModel {
    struct Category {
        let id: Int
        let name: String
        let imageUrl: String
    }
    let categories: [CategoryModel.Category]
}

struct CategoryResponseModel: Decodable {
    
    struct Category: Decodable {
        let id: Int
        let name: String
        let imageUrl: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case imageUrl = "image_url"
        }
    }
    
    let сategories: [CategoryResponseModel.Category]
}

class MainUseCases {
    func map(model: CategoryResponseModel) -> CategoryModel {
        let categories: [CategoryModel.Category] = model.сategories.compactMap { item in
            return CategoryModel.Category(id: item.id, name: item.name, imageUrl: item.imageUrl)
        }
        return CategoryModel(categories: categories)
    }
}




