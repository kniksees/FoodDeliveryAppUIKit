//
//  MenuViewController.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 12.01.2024.
//

import UIKit

class MenuViewController: UIViewController {
    
    var presenter: MenuViewPresenterProtocol!
    
    let cityView: UIView = {
        let v = UIView()
        return v
    }()

    let bannerView: UIView = {
        let v = UIView()
        return v
    }()
    
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
        let v = CityView()
        cityView.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: cityView.topAnchor),
            v.leadingAnchor.constraint(equalTo: cityView.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: cityView.trailingAnchor),
            v.bottomAnchor.constraint(equalTo: cityView.bottomAnchor),
        ])
    }
    
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
        let v = CategoriesView()
        categoriesView.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: categoriesView.topAnchor),
            v.leadingAnchor.constraint(equalTo: categoriesView.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: categoriesView.trailingAnchor),
            v.bottomAnchor.constraint(equalTo: categoriesView.bottomAnchor),
        ])
    }
    
    func setupMenuView() {
        let v = MenuView()
        menuView.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: menuView.topAnchor),
            v.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: menuView.trailingAnchor),
            v.bottomAnchor.constraint(equalTo: menuView.bottomAnchor),
        ])
    }
    
    override func viewDidLoad() {
        presenter.showFood()
        super.viewDidLoad()
        
        view.addSubview(cityView)
        view.addSubview(scrollView)
        [bannerView, menuView, categoriesView].forEach { v in
            scrollView.addSubview(v)
        }
        [bannerView, menuView, categoriesView, scrollView].forEach { v in
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
            
            scrollView.topAnchor.constraint(equalTo: cityView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor),
            
            bannerView.leadingAnchor.constraint(equalTo: frameG.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: frameG.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 140.0),
            bannerView.topAnchor.constraint(equalTo: frameG.topAnchor),
            
            categoriesView.leadingAnchor.constraint(equalTo: frameG.leadingAnchor),
            categoriesView.trailingAnchor.constraint(equalTo: frameG.trailingAnchor),
            categoriesView.heightAnchor.constraint(equalToConstant: 70.0),
            categoriesView.topAnchor.constraint(greaterThanOrEqualTo: frameG.topAnchor),
            
            menuView.leadingAnchor.constraint(equalTo: contentG.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: contentG.trailingAnchor),
            menuView.bottomAnchor.constraint(equalTo: contentG.bottomAnchor),
            menuView.widthAnchor.constraint(equalTo: frameG.widthAnchor),
        ])
        
        var c: NSLayoutConstraint!
        
        c = menuView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor)
        c.priority = .defaultHigh
        c.isActive = true
        
        c = menuView.topAnchor.constraint(equalTo: contentG.topAnchor, constant: 210.0)
        c.isActive = true
        
        setupCityView()
        setupBunnerVew()
        setupCategoriesView()
        setupMenuView()
        
    }
    
}

extension MenuViewController: MenuViewProtocol {
    func setPizzaList(pizza: [Food]) {
        <#code#>
    }
    
    func setComboList(pizza: [Food]) {
        <#code#>
    }
    
    func setDessertList(pizza: [Food]) {
        <#code#>
    }
    
    func setDrinkList(pizza: [Food]) {
        <#code#>
    }
    
    
}
