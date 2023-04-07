//
//  ProductGroupModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import SwiftUI

struct ProductGroup: Codable, Identifiable {
    let _id: String
    let name: String
    let description: String
    let imageName: String?
    
    var id: String { _id }
    var imageURLString: String {
        if (imageName != nil) {
            return "http://\(serverIP)/images/marketing/productGroups/\(imageName!)"
        };  return ""
    }
}
