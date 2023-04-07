//
//  CoverImagesTabView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import SwiftUI

struct CoverImagesTabView: View {
    // MARK: - PROPERTIES
    
    @StateObject private var marketingMaterials = MarketingMaterials()

    // MARK: - BODY
    var body: some View {
        if (marketingMaterials.loadedAtStartup) {
            TabView {
                ForEach(marketingMaterials.coverImages, id: \.self) { coverImage in
                    CoverImageView(coverImage: coverImage)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                } //: LOOP
            } //: TAB
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        } else {
            ProgressView()
        }
    }
}

    // MARK: - PREVIEW
struct CoverImagesTabView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImagesTabView()
            .background(Color.gray)
    }
}
