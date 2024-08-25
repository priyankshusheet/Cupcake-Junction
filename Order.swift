//
//  Order.swift
//  CupcakeJunction
//
//  Created by Priyankshu Sheet on 10/08/24.
//

import Foundation

struct Order: Codable, Identifiable {
    var id: String
    var type: Int
    var quantity: Int
    var specialRequestEnabled = false
    var extraFrosting = false
    var addSprinkles = false

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var cost: Double {
        
        var cost = Double(quantity) * 2

        cost += (Double(type) / 2)

        if extraFrosting {
            cost += Double(quantity)
        }

        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
    var hadValidAddress: Bool {
        !name.isEmpty && !streetAddress.isEmpty && !city.isEmpty && !zip.isEmpty
    }
    
    var name: String = ""
    var streetAddress: String = ""
    var city: String = ""
    var zip: String = ""
}
