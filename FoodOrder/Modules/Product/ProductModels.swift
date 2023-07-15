////
////  CategoryModels.swift
////  FoodOrder
////
////  Created by Nataliya Mikhailova on 14.07.2023.
////
//
//import UIKit
//
//struct ProductsViewModel {
//    
//    struct CategoryProduct {
//        let name: String
//        let teg: String
//    }
//    let categories: CategoryProduct
//    let product: [CategoryModel.ProductModel]
//}
//
//struct CategoryModel {
//    
//    struct ProductModel {
//        let id: Int
//        let name: String
//        let price: String
//        let weight: String
//        let description: String
//        let image: String
//        let tegs: String
//    }
//    
//    let products: [CategoryModel.ProductModel]
//    
//}
//
//struct ProductResponseModel: Decodable {
//    
//    struct Dishes: Decodable {
//        let id: Int
//        let name: String
//        let price: String
//        let weight: String
//        let description: String
//        let imageUrl: String
//        let tegs: String
//        
//        enum CodingKeys: String, CodingKey {
//            case id
//            case name
//            case price
//            case weight
//            case description
//            case imageUrl = "image_url"
//            case tegs
//        }
//    }
//    
//    let products: [ProductResponseModel.Dishes]
//}
//
//class CategoryUseCases {
//    func map(model: ProductResponseModel) -> CategoryModel {
//        let products: [CategoryModel.ProductModel] = model.products.compactMap { item in
//            return CategoryModel.ProductModel(id: item.id, name: item.name, price: item.price, weight: item.weight, description: item.description, image: item.imageUrl, tegs: item.tegs)
//        }
//        return CategoryModel(products: products)
//    }
//}
//
//
//
//
