//
//  OrderFormDataModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 11/1/22.
//

import SwiftUI

struct pictureOrder: Codable {
    var name: String
    var size: String
    var cost: Float
    var description: String
    var paid: Bool?
    var id: Int?
}

struct newOrder: Codable {
    var order: pictureOrder
}

let emptyOrder: newOrder = newOrder(order: pictureOrder(name: "", size: "", cost: 0.00, description: "", paid: nil))
