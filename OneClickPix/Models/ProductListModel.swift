//
//  ProductListModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/29/23.
//

import SwiftUI

class ProductList: ObservableObject {
    // MARK: - PROPERTIES
    @Published var products = [Product]()
    @Published var productGroups = [ProductGroup]()
    @Published var productSizes = [ProductSize]()
    @Published var loadedAtStartup: Bool = false
    @Published var productImages: [String: UIImage] = [:]
    @Published var productGroupImages: [String: UIImage] = [:]
    
    // MARK: - INIT
    init() {
        // MARK: - PRODUCTS
        // GET PRODUCTS LIST FROM SERVER
        getProductList { products in
            self.products = products
            for product in self.products {
                // ASSIGN PRODUCT IMAGE TO DICTIONARY WITH KEY CORRESPONDING TO PRODUCT ID
                getImage(fromAPIEndpoint: product.imageURLString) {uiimage in
                    self.productImages[product.id] = uiimage
                }
            }
            self.loadedAtStartup = true
        }
        // MARK: - GROUPS
        // GET PRODUCT GROUPS FROM SERVER
        getProductGroups { productGroups in
            self.productGroups = productGroups
            for productGroup in self.productGroups {
                // ASSIGN GROUP IMAGE TO DICTIONARY WITH KEY CORRESPONDING TO GROUP ID
                getImage(fromAPIEndpoint: productGroup.imageURLString) { uiimage in
                    self.productGroupImages[productGroup.id] = uiimage
                }
            }
        }
        // MARK: - SIZES
        // ititialize product sizes with data and images from server here
        
    }
}
