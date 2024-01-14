//
//  MenuViewController.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 12.01.2024.
//

import UIKit

class MenuViewController: UIViewController {
    
    var presenter: MenuViewPresenterProtocol!
    
    var scrollView: UIScrollView!
    var categoriesView: CategoriesView!
    
    override func viewDidLoad() {

        scrollView = {
            let v = UIScrollView()
            v.backgroundColor = .appGray
            return v
        }()
        
        let cityView: CityView = {
            let v = CityView()
            v.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
            return v
        }()
        

        let bannerView: BannersView = {
            let v = BannersView()
            return v
        }()
        
        categoriesView = {
            let v = CategoriesView()
            v.backgroundColor = .green
            return v
        }()
        categoriesView.pizzaButton.addTarget(self, action: #selector(scrollToPizza(_:)), for: .touchUpInside)
        categoriesView.comboButton.addTarget(self, action: #selector(scrollToCombo(_:)), for: .touchUpInside)
        categoriesView.dessertButton.addTarget(self, action: #selector(scrollToDessert(_:)), for: .touchUpInside)
        categoriesView.drinkButton.addTarget(self, action: #selector(scrollToDrink(_:)), for: .touchUpInside)
        
        let menuView: MenuView = {
            let v = MenuView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), presenter: presenter)
            v.backgroundColor = .appGray
            return v
        }()
        

        
        super.viewDidLoad()
        
        view.addSubview(cityView)
        view.addSubview(scrollView)
        [bannerView, menuView, categoriesView].forEach { v in
            scrollView.addSubview(v)
        }
        [bannerView, menuView, categoriesView, scrollView].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeG = view.safeAreaLayoutGuide
        
        let contentG = scrollView.contentLayoutGuide
        let frameG = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            
            cityView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            cityView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            cityView.heightAnchor.constraint(equalToConstant: 100.0),
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
        
    }
    
    @objc func scrollToPizza(_ sender: UIButton) {
        let offset = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    }
    @objc func scrollToCombo(_ sender: UIButton) {
        let offset = CGPoint(x: 0, y: 140 + 171 * (presenter.food?.pizza.count ?? 0))
        scrollView.setContentOffset(offset, animated: true)
    }
    @objc func scrollToDessert(_ sender: UIButton) {
        let offset = CGPoint(x: 0, y: 140 + 171 * ((presenter.food?.pizza.count ?? 0) + (presenter.food?.combo.count ?? 0)))
        scrollView.setContentOffset(offset, animated: true)
    }
    @objc func scrollToDrink(_ sender: UIButton) {
        var pizzaCount = presenter.food?.pizza.count ?? 0
        var comboCOunt = presenter.food?.combo.count ?? 0
        var dessertCount = presenter.food?.dessert.count ?? 0
        let offset = CGPoint(x: 0, y: 140 + 171 * (pizzaCount + comboCOunt + dessertCount))
        scrollView.setContentOffset(offset, animated: true)
    }
}



extension MenuViewController: MenuViewProtocol {
    func succes() {
        self.viewDidLoad()
    }
}
