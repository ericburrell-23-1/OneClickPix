//
//  OneClickPixApp.swift
//  OneClickPix
//
//  Created by Eric Burrell on 10/31/22.
//

import SwiftUI

@main
struct OneClickPixApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ShoppingCart())
                .environmentObject(ProductList())
        }
    }
}
