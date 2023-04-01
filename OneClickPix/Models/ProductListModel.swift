//
//  ProductListModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/29/23.
//

import SwiftUI

class ProductList: ObservableObject {
    @Published var Products = [Product]()
    @Published var ProductGroups = [ProductGroup]()
    @Published var ProductSizes = [ProductSize]()
    @Published var loadedAtStartup: Bool = false
}
