//
//  ProductSizeModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/29/23.
//

import Foundation

struct ProductSize: Codable, Identifiable {
    let x: Float
    let y: Float
    let _id: String
    
    var id: String { _id }
}
