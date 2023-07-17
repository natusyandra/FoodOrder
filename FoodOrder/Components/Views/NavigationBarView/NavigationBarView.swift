//
//  NavigationBarView.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation
import UIKit
import CoreLocation

struct NavigationBarViewModel {
    let cityName: String?
    let date: String
}

struct NavigationBarModel {
    let cityName: String?
    let date: Date = Date()
}

class NavigationBarUseCases {
    func map(model: NavigationBarModel) -> NavigationBarViewModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        let formattedDate = dateFormatter.string(from: model.date)
        return NavigationBarViewModel(cityName: model.cityName, date: formattedDate)
    }
}

class NavigationBarView: UIStackView {
    
    
    private lazy var locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "SFProDisplay-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "SFProDisplay-Regular", size: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelsVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [locationLabel, dateLabel])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cat"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 22
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    let currentDate = Date()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        alignment = .top
        distribution = .fill
        spacing = 4
        
        addArrangedSubview(locationImage)
        addArrangedSubview(labelsVStackView)
        addArrangedSubview(profileButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            locationImage.widthAnchor.constraint(equalToConstant: 24),
            locationImage.heightAnchor.constraint(equalToConstant: 24),
            
            profileButton.widthAnchor.constraint(equalToConstant: 44),
            profileButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    public func setup(viewModel: NavigationBarViewModel) {
        locationLabel.text = viewModel.cityName
        dateLabel.text = viewModel.date
    }
}

