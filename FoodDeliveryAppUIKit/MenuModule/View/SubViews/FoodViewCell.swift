//
//  PizzaView.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 13.01.2024.
//

import UIKit

class FoodViewCell: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()

    let foodView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleToFill
        return v
    }()
    
    let nameLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        v.textColor = .black
        return v
    }()

    let descriptionLabel: UILabel = {
        let v = UILabel()
        v.numberOfLines = 5
        v.font = UIFont.systemFont(ofSize: 13, weight: .light)
        v.textColor = .gray
        return v
    }()
    
    let priceView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 6
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(named: "categoriesPink1")?.cgColor
        return v
    }()
    
    let priceLabel: UILabel = {
        let v = UILabel()
        v.textColor = .categoriesPink1
        v.font = UIFont.systemFont(ofSize: 13, weight: .light)
        return v
    }()

    func setup() {
        addSubview(backgroundView)
        backgroundView.addSubview(foodView)
        backgroundView.addSubview(nameLabel)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(priceView)
        priceView.addSubview(priceLabel)

        foodView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.widthAnchor.constraint(equalTo: super.widthAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 170),
            
            foodView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            foodView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            foodView.widthAnchor.constraint(equalToConstant: 130),
            foodView.heightAnchor.constraint(equalToConstant: 130),
            
            nameLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: -20),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            
            priceView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant:  -20),
            priceView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -15),
            priceView.heightAnchor.constraint(equalToConstant: 32),
            priceView.widthAnchor.constraint(equalToConstant: 87),
            
            priceLabel.centerXAnchor.constraint(equalTo: priceView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceView.centerYAnchor),
        ])
    }
}


