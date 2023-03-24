//
//  ProductGroupModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import Foundation

struct ProductGroup: Codable, Identifiable {
    let _id: String
    var id: String { return _id }
    let name: String
    let description: String
    let image: String
    
    var imageURL: URL? { return URL(string: "http://\(serverIP)/images/marketing/productGroups/\(image)") }
}
