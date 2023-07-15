//
//  MainModels.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 14.07.2023.
//

import UIKit

struct CategoryViewModel {
    struct LocationData {
        let cityName: String
        let date: String
    }
    let location: LocationData
    let categories: [CategoryModel.CategoryModel]
}

struct CategoryModel {
    struct CategoryModel {
        let id: Int
        let name: String
        let imageUrl: String
    }
    let categories: [CategoryModel.CategoryModel]
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
        let categories: [CategoryModel.CategoryModel] = model.сategories.compactMap { item in
            return CategoryModel.CategoryModel(id: item.id, name: item.name, imageUrl: item.imageUrl)
        }
        return CategoryModel(categories: categories)
    }
}




