//
//  ViewController.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 12.01.2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: MenuViewController(),
                       title: "Меню",
                       image: UIImage(named: "menuIcon")),
            generateVC(viewController: ContactsViewController(),
                       title: "Контакты",
                       image: UIImage(named: "contactsIcon")),
            generateVC(viewController: ProfileViewController(),
                       title: "Профиль",
                       image: UIImage(named: "profileIcon")),
            generateVC(viewController: ShoppingCartViewController(),
                       title: "Корзина",
                       image: UIImage(named: "ShoppingCardIcon"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(named: "tabBarRed")
        tabBar.unselectedItemTintColor = UIColor(named: "tabBarGray")
    }


}

