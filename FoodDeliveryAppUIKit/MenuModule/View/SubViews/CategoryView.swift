//
//  CategoryView.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import UIKit

class CategoryView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let categoryView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 16
        v.layer.borderColor = UIColor(named: "categotiesPink2")?.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    let categoryLabel: UILabel = {
        let v = UILabel()
        v.textColor = .categotiesPink2
        v.font = UIFont.systemFont(ofSize: 13)
        return v
    }()
    
    func setup() {
        addSubview(categoryView)
        categoryView.addSubview(categoryLabel)

        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryView.heightAnchor.constraint(equalToConstant: 32),
            categoryView.widthAnchor.constraint(equalToConstant: 88),
            categoryLabel.centerXAnchor.constraint(equalTo: categoryView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: categoryView.centerYAnchor)
            
        ])
    }

}
