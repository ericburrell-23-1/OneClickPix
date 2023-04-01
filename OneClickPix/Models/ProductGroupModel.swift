//
//  ProductGroupModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import Foundation

struct ProductGroup: Codable, Identifiable {
    let _id: String
    var id: String { _id }
    let name: String
    let description: String
    let imageName: String?
    
    var imageURL: URL? {
        if (imageName != nil) {
            return URL(string: "http://\(serverIP)/images/marketing/productGroups/\(imageName!)")
        }
        return URL(string: "")
    }
}
