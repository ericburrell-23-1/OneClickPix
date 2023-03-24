//
//  HomePage.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/22/23.
//

import SwiftUI

struct HomePage: View {
    // MARK: - PROPERTIES
    
    //@Environment(\.refresh) private var refresh
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal)
                    .padding(.bottom)
                    .padding(.top, topSafeAreaPaddingLength)
                    .background(.black)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        CoverImagesTabView()
//                            .task {
//                                await getImageNames(forEndpoint: "/api/offerings/marketing")
//                            }
                            .frame(height: UIScreen.main.bounds.width / 1.175)
                            .padding(.vertical, 20)
                        
                        ProductGroupGridView()
                        
                        FooterView()
                    } //: VSTACK
                } //: SCROLL
            } //: VSTACK
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        } //: ZSTACK
        .ignoresSafeArea(.all, edges: .all)
    }
}

    // MARK: - PREVIEW
struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .previewDevice("iPhone 11")
            .padding()
    }
}
