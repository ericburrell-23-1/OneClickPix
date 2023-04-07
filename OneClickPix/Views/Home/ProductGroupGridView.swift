//
//  ProductGroupGridView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/24/23.
//

import SwiftUI

struct ProductGroupGridView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var productList: ProductList

    // MARK: - BODY
    var body: some View {
        if productList.loadedAtStartup {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
                    Section(content: {
                        ForEach(productList.productGroups) { productGroup in
                            ProductGroupItemView(productGroup: productGroup)
                        } //: LOOP
                    },
                            header: { GridHeaderFooterView(rotateClockwise: false) },
                            footer: { GridHeaderFooterView(rotateClockwise: true) })
                } //: GRID
                .frame(height: 400)
                .padding(.horizontal, 25)
                .padding(.vertical, 10)
            } //: SCROLL
        } else { ProgressView() }
    }
}

    // MARK: - PREVIEW
struct ProductGroupGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGroupGridView()
            .environmentObject(ProductList())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
