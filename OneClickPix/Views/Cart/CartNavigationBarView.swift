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
    @State private var cartIsEmpty: Bool = true
    @EnvironmentObject var shoppingCart: ShoppingCart

    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                //cartIsEmpty.toggle()
                shoppingCart.showCart = false
            }, label: {
                ZStack {
                    Image(systemName: "arrow.uturn.backward")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14, height: 14, alignment: .center)
                        .offset(x: 13, y: -10)
                        .opacity(cartIsEmpty ? 0 : 1)
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
            
            Button(action: {}, label: {
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
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
