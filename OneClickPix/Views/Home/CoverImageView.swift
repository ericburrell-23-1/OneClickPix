//
//  CoverImageView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/23/23.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    
    let coverImage: String
    
    // MARK: - BODY
    var body: some View {
        AsyncImage(url: URL(string: "http://\(serverIP)/images/marketing/coverImages/\(coverImage)"), content: { image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
        }, placeholder: {
            ProgressView()
        })
    }
}
    
// MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView(coverImage: "photoGifts.png")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
