//
//  CoverImagesTabView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import SwiftUI

struct CoverImagesTabView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImageNames, id: \.self) { coverImage in
                CoverImageView(coverImage: coverImage)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

    // MARK: - PREVIEW
struct CoverImagesTabView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImagesTabView()
            .previewDevice("iPhone 11")
            .background(Color.gray)
    }
}
