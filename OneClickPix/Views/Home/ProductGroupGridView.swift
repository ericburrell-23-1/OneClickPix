//
//  ProductGroupGridView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/24/23.
//

import SwiftUI

struct ProductGroupGridView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
                Section(content: {
                    ForEach(productGroups) { productGroup in
                        ProductGroupItemView(productGroup: productGroup)
                    } //: LOOP
                },
                        header: { GridHeaderFooterView(rotateClockwise: false) },
                        footer: { GridHeaderFooterView(rotateClockwise: true) })
            } //: GRID
            .frame(height: 280)
            .padding(.horizontal, 25)
            .padding(.vertical, 25)
        } //: SCROLL
    }
}

    // MARK: - PREVIEW
struct ProductGroupGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGroupGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
