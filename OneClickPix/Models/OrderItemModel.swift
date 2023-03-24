//
//  OrderItemModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 11/1/22.
//

import SwiftUI

struct Item: Codable, Identifiable {
    var product: String
    var productSize: String
    var quantity: Int
    var imageURL: String
    var finishingOptions: [String]?
    var _id: String?
    var id: String { return _id ?? UUID().uuidString }
}

let emptyItem: Item = Item(product: "", productSize: "", quantity: 0, imageURL: "")
