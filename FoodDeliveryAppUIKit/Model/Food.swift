//
//  Food.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let pizza, combo, dessert, drink: [Food]
}

// MARK: - Food
struct Food: Codable {
    let id: Int
    let name: String
    let price: Int
    let desctiption: String
    let image: String
}

