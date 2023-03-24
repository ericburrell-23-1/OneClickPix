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
    
    let productGroup: ProductGroup

    // MARK: - BODY
    var body: some View {
        Button(action: {}) {
            HStack(alignment: .center, spacing: 12) {
                CachedAsyncImage(url: productGroup.imageURL, content: { image in
                    image
                        //.renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .frame(width: 100, height: 80, alignment: .center)
                        .foregroundColor(.gray)
                    
                }, placeholder: {
                    Image(systemName: "gift")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundColor(.gray)
                })
                
                Text(productGroup.name.uppercased())
                    .padding(.vertical, 25)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.05)
                    .foregroundColor(colorLightGray)
                    .lineLimit(1)
                
                Spacer()
            } //: HSTACK
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
        ProductGroupItemView(productGroup: productGroups[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
