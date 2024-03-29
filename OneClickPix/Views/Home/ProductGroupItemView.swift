//
//  ProductGroupItemView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import SwiftUI
import CachedAsyncImage

struct ProductGroupItemView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var productList: ProductList
    
    let productGroup: ProductGroup

    // MARK: - BODY
    var body: some View {
        Button(action: {}) {
            VStack(alignment: .center, spacing: 12) {
                if let groupImage = productList.productGroupImages[productGroup.id] {
                    Image(uiImage: groupImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .frame(width: 156, height: 116, alignment: .center)
                        .foregroundColor(.gray)
                }
                else {
                    Image(systemName: "gift")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundColor(.gray)
                }
                
                Text(productGroup.name.uppercased())
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.05)
                    .foregroundColor(colorLightGray)
                    .lineLimit(1)
                
            } //: VSTACK
            .padding()
            .background(Color.black.cornerRadius(12))
            .background(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, lineWidth: 1))
        } //: BUTTON
    }
}

    // MARK: - PREVIEW
struct ProductGroupItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGroupItemView(productGroup: sampleProductGroups[0])
            .environmentObject(ProductList())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
