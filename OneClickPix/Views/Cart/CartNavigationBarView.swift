//
//  CartNavigationBarView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/14/23.
//

import SwiftUI

struct CartNavigationBarView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    @EnvironmentObject var shoppingCart: ShoppingCart

    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                shoppingCart.showCart = false
            }, label: {
                ZStack {
                    Image(systemName: "arrow.uturn.backward")
                        .font(.title)
                        .foregroundColor(.white)

                } //: ZSTACK
            }) //: BUTTON
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
            
            Spacer()
            
            Button(action: {
                clearCart { refreshedCart in
                    shoppingCart.cart = refreshedCart
                }
            }, label: {
                Image(systemName: "trash")
                    .font(.title)
                    .foregroundColor(.white)
            }) //: BUTTON
        } //: HSTACK
    }
}
    // MARK: - PREVIEW
struct CartNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        CartNavigationBarView()
            .environmentObject(ShoppingCart())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
