//
//  File.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    
}

class MainInteractor {
    weak var presenter: MainPresenterProtocol!
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
}
