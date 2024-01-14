//
//  MenuScreenPresentor.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import Foundation

protocol MenuViewProtocol: AnyObject {
    func setPizzaList(pizza: [Food])
    func setComboList(pizza: [Food])
    func setDessertList(pizza: [Food])
    func setDrinkList(pizza: [Food])
}

protocol MenuViewPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, model: Model)
    func showFood()
}

class MenuScreenPresentor: MenuViewPresenterProtocol {
    
    let view: MenuViewProtocol
    let model: Model
    
    required init(view: MenuViewProtocol, model: Model) {
        self.view = view
        self.model = model
    }
    
    func showFood() {
        view.setPizzaList(pizza: model.pizza)
        view.setComboList(pizza: model.combo)
        view.setDessertList(pizza: model.dessert)
        view.setDrinkList(pizza: model.drink)
    }
    
    
}
