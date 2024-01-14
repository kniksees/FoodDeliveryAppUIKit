//
//  NetworkManager.swift
//  FoodDeliveryAppUIKit
//
//  Created by Дмитрий Ерофеев on 14.01.2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func getModel(link: String) async -> Model?
    func getData(link: String) async -> Data?
}

class NetworkManager: NetworkManagerProtocol {
        func getModel(link: String) async -> Model? {
            guard let url = URL(string: link) else {
                return nil
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                do {
                    return try JSONDecoder().decode(Model.self, from: data)
                } catch {
                    return nil
                }
            } catch {
                return nil
            }
        }
    
    func getData(link: String) async -> Data? {
        guard let link = URL(string: link) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: link)
            return data
        } catch {
            return nil
        }
    }
}
