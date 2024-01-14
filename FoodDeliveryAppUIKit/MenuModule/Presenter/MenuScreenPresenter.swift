//
//  MenuScreenPresentor.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import Foundation

protocol MenuViewProtocol: AnyObject {
    func succes()
}

protocol MenuViewPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, networkManager: NetworkManagerProtocol)
    func getFood()
    var food: Model? {get set}
    var pizzaImages: [Int: Data?] {get set}
    var comboImages: [Int: Data?] {get set}
    var dessertImages: [Int: Data?] {get set}
    var drinkImages: [Int: Data?] {get set}
}

class MenuScreenPresenter: MenuViewPresenterProtocol {
    
    weak var view: MenuViewProtocol?
    let networkManager: NetworkManagerProtocol!
    var food: Model?
    var pizzaImages = [Int: Data?]()
    var comboImages = [Int: Data?]()
    var dessertImages = [Int: Data?]()
    var drinkImages = [Int: Data?]()
    required init(view: MenuViewProtocol, networkManager: NetworkManagerProtocol) {
        self.view = view
        self.networkManager = networkManager
        getFood()
    }
    
    func getFood() {
        Task {
            food = await networkManager.getModel(link: "https://run.mocky.io/v3/99b6ffb9-7e2b-4bbb-9f77-709cbeb5ec2a")
            if food != nil {
                for i in food!.pizza {
                    pizzaImages[i.id] = await networkManager.getData(link: i.image)
                }
                for i in food!.combo {
                    comboImages[i.id] = await networkManager.getData(link: i.image)
                }
                for i in food!.dessert {
                    dessertImages[i.id] = await networkManager.getData(link: i.image)
                }
                for i in food!.drink {
                    drinkImages[i.id] = await networkManager.getData(link: i.image)
                }
            }
            await MainActor.run {
                view!.succes()
            }
        }
    }
}
