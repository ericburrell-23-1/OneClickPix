//
//  ContentView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            HomePage()
                .tabItem {
                    Image(systemName: "bag.circle.fill")
                    Text("Product")
                }
            //.navigationTitle("New Product")
            CreateOrderView()
                .tabItem {
                    Image(systemName: "envelope")
                    Text("Order Form")
                }
            //.navigationTitle("New Order")
        } //: TAB
        .navigate(to: CartView(), when: $shoppingCart.showCart)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
