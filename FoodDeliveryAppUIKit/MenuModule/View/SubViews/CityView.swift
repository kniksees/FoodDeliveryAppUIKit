//
//  CityView.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import UIKit

class CityView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cityView: UIView = {
        let v = UIView()
        v.backgroundColor = .appGray
        return v
    }()
    
    let button: UIButton = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 17)
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString("Москва ", attributes: container)
        configuration.image = UIImage(named: "arrowIcon")
        configuration.imagePlacement = .trailing
        configuration.baseForegroundColor = .black
        let v = UIButton(configuration: configuration, primaryAction: nil)
        return v
    }()
    
    func setup() {
        addSubview(cityView)
        cityView.addSubview(button)
        cityView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityView.heightAnchor.constraint(equalToConstant: 100),
            cityView.widthAnchor.constraint(equalTo: super.widthAnchor),
            
            button.leadingAnchor.constraint(equalTo: cityView.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: cityView.bottomAnchor),
        ])
    }
}
