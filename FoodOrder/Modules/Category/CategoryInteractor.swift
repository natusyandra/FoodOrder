//
//  File.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation

protocol CategoryInteractorProtocol: AnyObject {
    func getCategories()
}

class CategoryInteractor {
    weak var presenter: CategoryPresenterProtocol!
    
    required init(presenter: CategoryPresenterProtocol) {
        self.presenter = presenter
    }
}

extension CategoryInteractor: CategoryInteractorProtocol {
    func getCategories() {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, response, error in
            
            if let error = error {
                // обработка ошибки
                return
            }
            
            do {
                guard let data = data else { return }
                let responseModel = try JSONDecoder().decode(CategoryResponseModel.self, from: data)
                let model = MainUseCases().map(model: responseModel)
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
