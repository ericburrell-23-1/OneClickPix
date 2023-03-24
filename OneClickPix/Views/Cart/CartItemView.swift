//
//  CartItemView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/15/23.
//

import SwiftUI

struct CartItemView: View {
    // MARK: - PROPERTIES
    let item: Item

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.product)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    
                    HStack {
                        Text(item.productSize)
                            
                        
                        Spacer()
                        
                        Text("Qty: " + String(item.quantity))
                    }
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }
                Spacer()
                
                ImageFromURLString(urlString: item.imageURL)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .foregroundColor(.white)
                    
            }
        }
        //.background(colorDarkGray.cornerRadius(8))
        //.frame(height: 285)
    }
}

    // MARK: - PREVIEW
struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        let previewItem = Item(product: "Classic Print", productSize: "8x10", quantity: 1, imageURL: "file:///private/var/mobile/Containers/Data/Application/DEB4533F-6273-46B1-AAD9-AAC505F8EAA2/tmp/EEAD10DB-1F35-4F3F-9225-4BAD47FA5501.jpeg")
        CartItemView(item: previewItem)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
