//
//  ProductModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/6/23.
//

import SwiftUI

struct Product: Codable {
    var _id: String
    var name: String
    var description: String
    var imageName: String
    var productGroups: [String]
    var productSizes: [String]
    var priceList: [Float]
}

class ProductList: ObservableObject {
    @Published var Products = [Product]()
}
