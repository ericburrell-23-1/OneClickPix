//
//  ProductModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/6/23.
//

import SwiftUI

struct Product: Codable, Identifiable {
    let _id: String
    let name: String
    let description: String
    let imageName: String?
    let productGroups: [ProductGroup]
    let productSizes: [ProductSize]
    let priceList: [Float]

    var id: String { _id }
    var imageURLString: String {
        if (imageName != nil) {
            return "http://\(serverIP)/images/marketing/products/\(imageName!)"
        };  return ""
    }
}
