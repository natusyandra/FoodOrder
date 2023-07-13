//
//  NavigationBarView.swift
//  FoodOrder
//
//  Created by Nataliya Mikhailova on 11.07.2023.
//

import Foundation
import UIKit
import CoreLocation

class NavigationBarView: UIStackView {
    
    private lazy var locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        //text как в figme
        label.font = UIFont.init(name: "SF Pro Display", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        // вынести в презентер
        let dateFormatter = DateFormatter()
        // июль с большой буквы?
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        let formattedDate = dateFormatter.string(from: currentDate)
        label.text = formattedDate
        //
        label.font = UIFont.init(name: "SF Pro Display", size: 14)
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
    
//    init() {
//        super.init(frame: .zero)
//        setupSubviews()
//        layoutSubviews()
//        getLocation()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        getLocation()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //вынести в презентер
    func getLocation() {
        
        let latitude = 43.126561
        let longitude = 131.924325
        
        
        // Create a CLLocation object with the coordinates
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let locale = Locale.init(identifier: "ru_RU")
        // Use the reverse geocoding to get the location address
        CLGeocoder().reverseGeocodeLocation(location, preferredLocale: locale) { (placemarks, error) in
            if let error = error {
                print("Reverse geocoding failed: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?.first {
                // Get the formatted address from the placemark
                if let address = placemark.subAdministrativeArea {
                    DispatchQueue.main.async {
                        self.locationLabel.text = address
                    }
                }
            }
        }
    }
        
    private func setupSubviews() {
        backgroundColor = .green
        
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        alignment = .top
        distribution = .fill
        spacing = 4
        
        addArrangedSubview(locationImage)
        addArrangedSubview(labelsVStackView)
        addArrangedSubview(profileButton)
    }
//
     private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            heightAnchor.constraint(equalToConstant: 100),
            
            locationImage.widthAnchor.constraint(equalToConstant: 24),
            locationImage.heightAnchor.constraint(equalToConstant: 24),
            
            profileButton.widthAnchor.constraint(equalToConstant: 44),
            profileButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}

