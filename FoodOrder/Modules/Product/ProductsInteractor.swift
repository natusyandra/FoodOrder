//
//  CAtegoryInteractor.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 12.07.2023.
//

import Foundation

protocol ProductsInteractorProtocol: AnyObject {
    func getProducts()
}

class ProductsInteractor {
    weak var presenter: ProductsPresenterProtocol!
    
    required init(presenter: ProductsPresenterProtocol) {
        self.presenter = presenter
    }
}

extension ProductsInteractor: ProductsInteractorProtocol {
    
    func getProducts() {
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, response, error in
            
            if let error = error {
                //сделать обработку ощибки
                return
            }
            
            do {
                guard let data = data else { return }
                let responseModel = try JSONDecoder().decode(ProductResponseModel.self, from: data)
                let model = CategoryUseCases().map(model: responseModel)
                DispatchQueue.main.async {
                    self?.presenter.response(model: model)
                }
            } catch {
                print("Invalid data")
            }
        }
        
        task.resume()
    }
}
