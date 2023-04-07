//
//  ProductItemView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/31/23.
//

import SwiftUI

struct ProductItemView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var productList: ProductList
    
    let product: Product
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            if let productImage = productList.productImages[product.id] {
                Image(uiImage: productImage)
                    .resizable()
                    .scaledToFit()
                //.cornerRadius(12)
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            Text(product.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 5)
                .padding(.horizontal, 15)
            
            Text(product.description + "\n")
                .padding(.horizontal, 15)
            
            Text("Found in: \(product.productGroups[0].name)")
                .padding(.horizontal, 15)
            
            Spacer()
        }
        .foregroundColor(.white)
        .background(colorBackground)
    }
}

    // MARK: - PREVIEW
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: sampleProduct)
            .previewLayout(.sizeThatFits)
    }
}
