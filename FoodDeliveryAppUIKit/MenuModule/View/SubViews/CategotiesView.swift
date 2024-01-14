//
//  CategotiesView.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import UIKit

class CategoriesView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .appGray
        return v
    }()
    
    let stackView: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = 20
        v.distribution = .equalCentering
        v.alignment = .center
        return v
    }()
    
    var pizzaButton: UIButton!
    var comboButton: UIButton!
    var dessertButton: UIButton!
    var drinkButton: UIButton!
    
    func setup() {

        pizzaButton = {
            let v = UIButton()
            v.layer.cornerRadius = 16
            v.layer.borderColor = UIColor(named: "categotiesPink2")?.cgColor
            v.layer.borderWidth = 1
            v.setTitle("Пицца", for: .normal)
            v.setTitleColor(.categotiesPink2, for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            v.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 32),
                v.widthAnchor.constraint(equalToConstant: 88),
            ])
            return v
        }()
        stackView.addArrangedSubview(pizzaButton)
        
        comboButton = {
            let v = UIButton()
            v.layer.cornerRadius = 16
            v.layer.borderColor = UIColor(named: "categotiesPink2")?.cgColor
            v.layer.borderWidth = 1
            v.setTitle("Комбо", for: .normal)
            v.setTitleColor(.categotiesPink2, for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            v.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 32),
                v.widthAnchor.constraint(equalToConstant: 88),
            ])
            return v
        }()
        stackView.addArrangedSubview(comboButton)
        
        dessertButton = {
            let v = UIButton()
            v.layer.cornerRadius = 16
            v.layer.borderColor = UIColor(named: "categotiesPink2")?.cgColor
            v.layer.borderWidth = 1
            v.setTitle("Десерты", for: .normal)
            v.setTitleColor(.categotiesPink2, for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            v.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 32),
                v.widthAnchor.constraint(equalToConstant: 88),
            ])
            return v
        }()
        stackView.addArrangedSubview(dessertButton)
        
        drinkButton = {
            let v = UIButton()
            v.layer.cornerRadius = 16
            v.layer.borderColor = UIColor(named: "categotiesPink2")?.cgColor
            v.layer.borderWidth = 1
            v.setTitle("Напитки", for: .normal)
            v.setTitleColor(.categotiesPink2, for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            v.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 32),
                v.widthAnchor.constraint(equalToConstant: 88),
            ])
            return v
        }()
        stackView.addArrangedSubview(drinkButton)

        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        [stackView, scrollView].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: super.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: super.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: super.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: super.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: -10)
        ])
    }
}
