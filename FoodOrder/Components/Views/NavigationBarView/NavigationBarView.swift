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
    
    let getLocation = GetLocation()
    
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        let formattedDate = dateFormatter.string(from: currentDate)
        label.text = formattedDate
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
        
        //в презентер
        getLocation.run {
            if let location = $0 {
                let location = CLLocation(latitude: location.coordinate.latitude , longitude: location.coordinate.longitude)
                let locale = Locale.init(identifier: "ru_RU")
                CLGeocoder().reverseGeocodeLocation(location, preferredLocale: locale) { (placemarks, error) in
                    if let error = error {
                        print("Reverse geocoding failed: \(error.localizedDescription)")
                        return
                    }
                    
                    if let placemark = placemarks?.first {
                        if let address = placemark.administrativeArea {
                            DispatchQueue.main.async {
                                self.locationLabel.text = address
                            }
                        }
                    }
                }
            } else {
                print("Get Location failed \(self.getLocation.didFailWithError)")
            }
        }
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
}

