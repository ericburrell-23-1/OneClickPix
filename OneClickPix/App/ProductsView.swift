//
//  ProductsView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/29/23.
//

import SwiftUI

struct ProductsView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var productList: ProductList

    // MARK: - BODY
    var body: some View {
        VStack {
            List(productList.products) { product in
                ProductItemView(product: product)
            }
        }
//        .task {
//            if !productList.loadedAtStartup {
//                getProductList { products in
//                    productList.products = products
//                }
//                productList.loadedAtStartup = true
//            }
//        }
    }
}

    // MARK: - PREVIEW
struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(ProductList())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
