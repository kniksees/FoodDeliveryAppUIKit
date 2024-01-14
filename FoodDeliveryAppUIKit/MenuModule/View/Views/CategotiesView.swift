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
    
    func setup() {

        ["Пицца", "Комбо", "Дессерты", "Напитки", "Роллы"].forEach { text in
            let v = CategoryView()
            v.categoryLabel.text = text
            v.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 32),
                v.widthAnchor.constraint(equalToConstant: 88),
            ])
            stackView.addArrangedSubview(v)
        }
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
