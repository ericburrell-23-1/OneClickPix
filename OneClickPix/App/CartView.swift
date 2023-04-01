//
//  CartView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/14/23.
//

import SwiftUI

struct CartView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                CartNavigationBarView()
                    .padding(.horizontal)
                    .padding(.bottom)
                    .padding(.top, topSafeAreaPaddingLength)
                    .background(.black)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                List(shoppingCart.cart.items) { item in
                    CartItemView(item: item)
                }
                .task {
                    await loadCart { refreshedCart in
                        shoppingCart.cart = refreshedCart
                        print(shoppingCart.cart)
                    }
                }
            }
        }
    }
}

    // MARK: - PREVIEW
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ShoppingCart())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
