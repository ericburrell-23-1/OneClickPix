//
//  NavigationBarView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/22/23.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    @State private var cartIsEmpty: Bool = true
    @EnvironmentObject var shoppingCart: ShoppingCart

    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.white)
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
                //cartIsEmpty.toggle()
                shoppingCart.showCart = true
            }, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 16, height: 16, alignment: .center)
                        .offset(x: 13, y: -10)
                        .opacity((shoppingCart.quantity == 0) ? 0 : 1)
                    
                    Text(String(shoppingCart.quantity))
                        .font(.footnote)
                        .foregroundColor(Color.white)
                        .offset(x: 13, y: -10)
                        .opacity((shoppingCart.quantity == 0) ? 0 : 1)
                } //: ZSTACK
            }) //: BUTTON
        } //: HSTACK
        .onDisappear {
            isAnimated = false
        }
    }
}

    // MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .environmentObject(ShoppingCart())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
