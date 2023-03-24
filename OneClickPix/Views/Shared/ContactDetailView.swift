//
//  ContactDetailView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/21/23.
//

import SwiftUI

struct ContactDetailView: View {
    // MARK: - PROPERTIES
    
    let image: String
    let text: String

    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .foregroundColor(.red)
            Text(text)
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .foregroundColor(colorLightGray)
            Spacer()
        }
        .frame(height: 35)
    }
}

    // MARK: - PREVIEW
struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(image: "mappin.and.ellipse", text: "415 N Grant St\nCrown Point, IN, 46307")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
