//
//  GridHeaderFooterView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/24/23.
//

import SwiftUI

struct GridHeaderFooterView: View {
    // MARK: - PROPERTIES
    
    @State var rotateClockwise: Bool

    // MARK: - BODY
        var body: some View {
            VStack(spacing: 0) {
                Spacer()
                
                Text("Product Groups".uppercased())
                    .font(.footnote)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .scaleEffect(2)
                    .scaledToFit()
                    .minimumScaleFactor(0.05)
                    .lineLimit(1)
                    .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
                
                Spacer()
            } //: VSTACK
            .background(Color.black.cornerRadius(12))
            .frame(width: 85)
        }
    }

    // MARK: - PREVIEW
struct GridHeaderFooterView_Previews: PreviewProvider {
    static var previews: some View {
        GridHeaderFooterView(rotateClockwise: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
