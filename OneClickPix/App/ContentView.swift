//
//  ContentView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 10/31/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var customerOrder: newOrder = emptyOrder
    
    // MARK: - BODY
    var body: some View {
        Form {
            Section(header: Text("Image Details")) {
                AnimatedTextFieldView(placeholderText: "ImageName", inputValue: $customerOrder.order.name)
                
                AnimatedTextFieldView(placeholderText: "Print Size", inputValue: $customerOrder.order.size)
                
                
            }
        }
        .navigationTitle("New Order")
        .padding()
    }
}

    // MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { ContentView() }
    }
}
