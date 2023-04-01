//
//  CoverImagesTabView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import SwiftUI

struct CoverImagesTabView: View {
    // MARK: - PROPERTIES
    
    @StateObject private var coverImages = CoverImages()

    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages.names, id: \.self) { coverImage in
                CoverImageView(coverImage: coverImage)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .task {
            if !coverImages.loadedAtStartup {
                getCoverImageNames { imageNames in
                    coverImages.names = imageNames
                    coverImages.loadedAtStartup = true
                }
            }
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
