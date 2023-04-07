//
//  CoverImageView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    
    let coverImage: UIImage
    
    // MARK: - BODY
    var body: some View {
        Image(uiImage: coverImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
    }
}
    
// MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        CoverImageView(coverImage: UIImage(named: "photoGifts")!)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
