//
//  ModuleBuilder.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import UIKit

protocol Builder {
    static func createMenuScreen() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMenuScreen() -> UIViewController {
        let view = MenuViewController()
        let networkManager = NetworkManager()
        let presenter = MenuScreenPresenter(view: view, networkManager: networkManager)
        view.presenter = presenter
        return view
    }
}
