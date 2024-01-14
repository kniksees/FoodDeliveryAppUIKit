//
//  BannersView.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import UIKit

class BannersView: UIView {

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
    
    let stack: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = 20
        return v
    }()
    
    func setup() {


        (1...5).forEach { _ in
            let view = UIImageView(image: UIImage(named: "banner1"))
            view.frame = CGRect(x: 0, y: 0, width: 330, height: 143)
            stack.addArrangedSubview(view)
        }
        scrollView.addSubview(stack)
       addSubview(scrollView)
        
        [stack, scrollView].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: super.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: super.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: super.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: super.bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
        ])
    }
}
