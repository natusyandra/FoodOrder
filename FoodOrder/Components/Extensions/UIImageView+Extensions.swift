//
//  UIImageView+Extensions.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 17.07.2023.
//

import UIKit

extension UIImageView {
    func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}

