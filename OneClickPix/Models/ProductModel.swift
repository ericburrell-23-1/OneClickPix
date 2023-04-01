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
//    var image: Image {
//        if imageName != nil {
//            return ImageFromURLString(urlString: "http://\(serverIP)/images/marketing/products/\(imageName!)")
//        }
//        return Image(systemName: "exclamationmark.square")
//    }
}
