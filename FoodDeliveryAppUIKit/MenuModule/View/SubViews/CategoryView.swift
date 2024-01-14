//
//  CategoryView.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import UIKit

class CategoryButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let categoryButton: UIButton = {
        let v = UIButton()
        v.layer.cornerRadius = 16
        v.layer.borderColor = UIColor(named: "categotiesPink2")?.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    

    func setup() {
        addSubview(categoryButton)
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryButton.heightAnchor.constraint(equalToConstant: 32),
            categoryButton.widthAnchor.constraint(equalToConstant: 88),
        ])
    }
}
