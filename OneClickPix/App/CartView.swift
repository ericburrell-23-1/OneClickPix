//
//  CartView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/14/23.
//

import SwiftUI

struct CartView: View {
    // MARK: - PROPERTIES
    
    @State var cart: Cart = emptyCart
    
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
                List(cart.items) { item in
                    CartItemView(item: item)
                }
                .task {
                    await loadCart { refreshedCart in
                        cart = refreshedCart
                        print(cart)
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
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
