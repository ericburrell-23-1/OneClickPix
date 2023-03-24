//
//  LogoView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/22/23.
//

import SwiftUI

struct LogoView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        HStack(spacing: 4) {
            Text("One Click".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.blue)
            
            Image("OneClickPix-Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("Pix".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.orange)
        }
    }
}

    // MARK: - PREVIEW
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
