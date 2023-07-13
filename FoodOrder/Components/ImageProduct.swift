//
//  ImageProduct.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 13.07.2023.
//

import Foundation
import UIKit

class ImageProduct: UIImageView {
    
    private var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "eda")
        image.backgroundColor = Pallete.backgroundColor
//        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
}
