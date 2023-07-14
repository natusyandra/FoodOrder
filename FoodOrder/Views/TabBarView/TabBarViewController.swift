//
//  TabBarViewController.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .systemBackground
        settingsForViewControllers()
    }
    
    func settingsForViewControllers() {
        viewControllers = [
            createNavController(for: MainViewController(), title: "Главная", image: UIImage(named: "mains") ?? .init()),
            createNavController(for: ViewController(), title: "Поиск", image: UIImage(named: "searchs") ?? .init()),
            createNavController(for: CartViewController(), title: "Корзина", image: UIImage(named: "bag") ?? .init()),
            createNavController(for: ViewController(), title: "Аккаунт", image: UIImage(systemName: "person.circle") ?? .init())
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title
        return navController
    }
}


