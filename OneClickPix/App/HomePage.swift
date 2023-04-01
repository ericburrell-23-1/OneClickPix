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
    @EnvironmentObject var shoppingCart: ShoppingCart
    
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
                    .task {
                        if !shoppingCart.loadedAtStartup {
                            await loadCart { refreshedCart in
                                shoppingCart.cart = refreshedCart
                                shoppingCart.loadedAtStartup = true
                                print(shoppingCart.cart)
                            }
                        }
                    }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        CoverImagesTabView()
                            .frame(height: UIScreen.main.bounds.width / 1.175)
                            .padding(.bottom, 20)
                        
                        SectionHeaderView(title: "What type of prints can we make for you today?")
                        
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
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .environmentObject(ShoppingCart())
                .previewDevice("iPhone 11")
        }
    }
}
