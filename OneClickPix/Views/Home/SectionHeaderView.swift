//
//  SectionHeaderView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/30/23.
//

import SwiftUI

struct SectionHeaderView: View {
    // MARK: - PROPERTIES
    
    var title: String

    // MARK: - BODY
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            
            Spacer()
        } //: HSTACK
        .padding(.horizontal)
        .padding(.top, 25)
        .padding(.bottom, 10)
    }
}

    // MARK: - PREVIEW
struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: "What type of prints can we make for you today?")
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
            .padding()
    }
}
