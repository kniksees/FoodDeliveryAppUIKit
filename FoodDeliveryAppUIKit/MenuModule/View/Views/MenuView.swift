//
//  FoodView.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import UIKit

class MenuView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.spacing = 1
        
        v.distribution = .equalCentering
        v.alignment = .center
        return v
    }()
    
    func setup() {
        addSubview(stackView)
        (1...20).forEach { n in
            let v = FoodViewCell()
            v.pizzaView.image = UIImage(named: "pizza")
            v.nameLabel.text = "Ветчина и грибы"
            v.descriptionLabel.text = "Ветчина, шампиньоны, увеличенная порци моцареллы, томатный соус"
            v.priceLabel.text = "от 345 р"
            
            
            stackView.addArrangedSubview(v)
            
            v.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 170),
                v.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            ])
            
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: super.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: 0),
        ])
    }

}
