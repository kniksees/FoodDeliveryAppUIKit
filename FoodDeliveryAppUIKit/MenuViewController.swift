//
//  MenuViewController.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 12.01.2024.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    let cityView: UIView = {
        let v = UIView()
        v.backgroundColor = .appGray
        return v
    }()
//    let bannerView: UIView = {
//        let v = UIView()
//        return v
//    }()
    
    let bannerView = BannersView()
    
    let categoriesView: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        return v
    }()
    let menuView: UIView = {
        let v = UIView()
        v.backgroundColor = .appGray
        return v
    }()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .appGray
        return v
    }()
    
    func setupCityView() {
        cityView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 17)
        
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString("Москва ", attributes: container)
        configuration.image = UIImage(named: "arrowIcon")
        // 1
        configuration.imagePlacement = .trailing
        configuration.baseForegroundColor = .black
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        
        cityView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: cityView.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: cityView.bottomAnchor),
        ])
    }
    
    //    func setupBunnerVew() {
    //        let scrollView: UIScrollView = {
    //            let v = UIScrollView()
    //            v.backgroundColor = .appGray
    //            return v
    //        }()
    //        let stack = UIStackView()
    //        stack.axis = .horizontal
    //        stack.spacing = 20
    //
    //        (1...5).forEach { _ in
    //            let view = UIImageView(image: UIImage(named: "banner1"))
    //            view.frame = CGRect(x: 0, y: 0, width: 330, height: 143)
    //            stack.addArrangedSubview(view)
    //        }
    //        scrollView.addSubview(stack)
    //        bannerView.addSubview(scrollView)
    //
    //        [stack, scrollView].forEach { v in
    //            v.translatesAutoresizingMaskIntoConstraints = false
    //        }
    //
    //        NSLayoutConstraint.activate([
    //            scrollView.topAnchor.constraint(equalTo: bannerView.topAnchor),
    //            scrollView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
    //            scrollView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
    //            scrollView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor),
    //
    //            stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
    //            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
    //            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
    //            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
    //        ])
    //    }
    func setupBunnerVew() {
        let v = BannersView()
        bannerView.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: bannerView.topAnchor),
            v.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
            v.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor),
        ])
    }
    
    
    func setupCategoriesView() {
        let scrollView: UIScrollView = {
            let v = UIScrollView()
            v.backgroundColor = .appGray
            return v
        }()
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalCentering
        stack.alignment = .center
        
        ["Пицца", "Комбо", "Дессерты", "Напитки", "Роллы"].forEach { text in
            let v = CategoryView()
            v.categoryLabel.text = text
            v.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 32),
                v.widthAnchor.constraint(equalToConstant: 88),
            ])
            stack.addArrangedSubview(v)
        }
        
        scrollView.addSubview(stack)
        categoriesView.addSubview(scrollView)
        
        [stack, scrollView].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: categoriesView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: categoriesView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: categoriesView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: categoriesView.bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            stack.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: -10)
        ])
    }
    
    func setupMenuView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cityView)
        
        // create a vertical stack view
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1
        
        stack.distribution = .equalCentering
        stack.alignment = .center
        
        
        (1...20).forEach { n in
            let v = FoodViewCell()
            v.pizzaView.image = UIImage(named: "pizza")
            v.nameLabel.text = "Ветчина и грибы"
            v.descriptionLabel.text = "Ветчина, шампиньоны, увеличенная порци моцареллы, томатный соус"
            v.priceLabel.text = "от 345 р"
            
            stack.addArrangedSubview(v)
            
            v.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                v.heightAnchor.constraint(equalToConstant: 170),
                v.widthAnchor.constraint(equalTo: stack.widthAnchor),
            ])
            
        }
        
        // add the stack view to the red view
        menuView.addSubview(stack)
        
        // add these views to scroll view in this order
        [bannerView, menuView, categoriesView].forEach { v in
            scrollView.addSubview(v)
        }
        
        // add scroll view to view
        view.addSubview(scrollView)
        
        // they will all use auto-layout
        [stack, bannerView, menuView, categoriesView, scrollView].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // always respect safe area
        let safeG = view.safeAreaLayoutGuide
        
        let contentG = scrollView.contentLayoutGuide
        let frameG = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            
            cityView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            cityView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            cityView.heightAnchor.constraint(equalToConstant: 50.0),
            cityView.topAnchor.constraint(equalTo: safeG.topAnchor),
            
            // constrain scroll view to safe area
            scrollView.topAnchor.constraint(equalTo: cityView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor),
            
            // we need yellow view to
            //  fill width of scroll view FRAME
            //  height: 100-pts
            //  "stick" to top of scroll view FRAME
            bannerView.leadingAnchor.constraint(equalTo: frameG.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: frameG.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 140.0),
            bannerView.topAnchor.constraint(equalTo: frameG.topAnchor),
            
            // we need green view to
            //  fill width of scroll view FRAME
            //  height: 100-pts
            //  start at bottom of yellow view
            //  "stick" to top of scroll view FRAME when scrolled up
            categoriesView.leadingAnchor.constraint(equalTo: frameG.leadingAnchor),
            // we'll use a constant of -40 here to leave a "gap" on the right, so it's
            //  easy to see what's happening...
            categoriesView.trailingAnchor.constraint(equalTo: frameG.trailingAnchor),
            categoriesView.heightAnchor.constraint(equalToConstant: 70.0),
            categoriesView.topAnchor.constraint(greaterThanOrEqualTo: frameG.topAnchor),
            
            // we need red view to
            //  fill width of scroll view FRAME
            //  dynamic height (determined by its contents - the stack view)
            //  start at bottom of green view
            //  "push / pull" green view when scrolled
            //  go under green view when green view is at top
            // red view will be controlling the scrollable area
            menuView.leadingAnchor.constraint(equalTo: contentG.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: contentG.trailingAnchor),
            menuView.bottomAnchor.constraint(equalTo: contentG.bottomAnchor),
            menuView.widthAnchor.constraint(equalTo: frameG.widthAnchor),
            
            // let's inset the stack view 16-pts on all 4 sides
            //            stack.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 16.0),
            //            stack.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 16.0),
            //            stack.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -16.0),
            //            stack.bottomAnchor.constraint(equalTo: menuView.bottomAnchor, constant: -16.0),
            stack.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 0),
            stack.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 0),
            stack.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: 0),
            stack.bottomAnchor.constraint(equalTo: menuView.bottomAnchor, constant: 0),
            
        ])
        
        var c: NSLayoutConstraint!
        
        // these constraints need Priority adjustments
        
        // keep green view above red view, until green view is at top
        c = menuView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor)
        c.priority = .defaultHigh
        c.isActive = true
        
        // since yellow and green view Heights are constant 100-pts each
        c = menuView.topAnchor.constraint(equalTo: contentG.topAnchor, constant: 210.0)
        c.isActive = true
        
        setupCityView()
        setupBunnerVew()
        setupCategoriesView()
        
    }
    
}
