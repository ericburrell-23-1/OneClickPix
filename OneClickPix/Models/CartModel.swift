//
//  CartModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/13/23.
//

import SwiftUI

struct Cart: Codable, Identifiable {
    let _id: String
    var id: String { return _id }
    let items: [Item]
    let cartDate: String
    var totalItemQuantity: Int {
        var total: Int = 0;
        for item in items {
            total += item.quantity
        }
        return total
    }
}

class ShoppingCart: ObservableObject {
    @Published var showCart: Bool = false
    @Published var quantity: Int = 0
}

let emptyCart = Cart(_id: "", items: [], cartDate: "")
