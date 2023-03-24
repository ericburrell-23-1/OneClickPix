//
//  FooterView.swift
//  Touchdown
//
//  Created by Eric Burrell on 2/21/23.
//

import SwiftUI

struct FooterView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("OneClickPix is a service provided by D&M Imaging, a leader in photo printing technology, with quality unmatched by our competitors.")
                .fontWeight(.semibold)
                .foregroundColor(colorLightGray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
                .padding(.vertical)
            
            HStack {
                Text("Contact Us:")
                    .underline()
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                
                Spacer()
            }
            
            ContactDetailView(image: "mappin.and.ellipse", text: "415 N Grant St\nCrown Point, IN, 46307")
            
            ContactDetailView(image: "phone", text: "+1 (219) 226-9550")
            
            ContactDetailView(image: "envelope", text: "info@dmimaging.net")
            
            Image("DM-Logo")
                //.renderingMode(.template)
                //.foregroundColor(.gray)
                .layoutPriority(0)
                .padding(.vertical)
            
            Text("© 2023 D&M Imaging. All Rights Reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(colorLightGray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        } //: VSTACK
        .padding()
        .padding(.bottom, 75)
    }
}

    // MARK: - PREVIEW
struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            FooterView()
                .previewLayout(.sizeThatFits)
                .background(colorBackground)
        }
    }
}
