//
//  CreateOrderView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 10/31/22.
//

import SwiftUI

struct CreateOrderView: View {
    // MARK: - PROPERTIES
    @State private var photoLibraryShowing = false
    @State var customerOrder: Item = emptyItem
    @State var itemImage: UIImage = UIImage(systemName: "photo")!
    @State var itemImageURL: URL? = nil
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal)
                    .padding(.bottom)
                    .padding(.top, topSafeAreaPaddingLength)
                    .background(colorBackground)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                //ScrollView {
                Form {
                    Section(header: Text("Order Details")) {
                        AnimatedTextFieldView(placeholderText: "Order", inputValue: $customerOrder.product, isRequired: true)
                        
                        AnimatedTextFieldView(placeholderText: "Print Size", inputValue: $customerOrder.productSize, isRequired: true)
                        
                        AnimatedTextFieldView(placeholderText: "Quantity", inputValue: Binding(
                            get: { String(customerOrder.quantity) },
                            set: { customerOrder.quantity = Int($0) ?? 0 }
                        ))
                    }
                    Section(header: Text("Photo"))
                    {
                        Image(uiImage: self.itemImage)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity, alignment: .center)
                            .padding(10)
                        Button(action: {
                            // Select photo from library
                            self.photoLibraryShowing = true
                            
                        }) {
                            HStack {
                                Spacer()
                                Text("Select Photo")
                                Spacer()
                                Image(systemName: "photo")
                                Spacer()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 50, maxHeight: 70)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding()
                        }
                    }
                    Button(action: {
                        // Send the new product to the server
                        customerOrder.imageURL = itemImageURL?.absoluteString ?? "N/A"
                        addToCart(item: customerOrder) { refreshedCart in
                            shoppingCart.cart = refreshedCart
                        }
                    }, label: {
                        Text("Add To Cart")
                    })
                    FooterView()
                }
                .padding()
                .sheet(isPresented: $photoLibraryShowing) {
                    ImagePicker(selectedImage: self.$itemImage, selectedImageURL: self.$itemImageURL, sourceType: .photoLibrary)
                }
                
            } //: VSTACK
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        } //: ZSTACK
        .ignoresSafeArea(.all, edges: .all)
    }
    //    var body: some View {
    //        Form {
    //            Section(header: Text("Image Details")) {
    //                AnimatedTextFieldView(placeholderText: "Product", inputValue: $customerOrder.items[0].product)
    //
    //                AnimatedTextFieldView(placeholderText: "Print Size", inputValue: $customerOrder.items[0].productSize)
    //
    //                AnimatedTextFieldView(placeholderText: "Quantity", inputValue: Binding(
    //                    get: { String(customerOrder.items[0].quantity) },
    //                    set: { customerOrder.items[0].quantity = Int($0) ?? 0 }
    //                ))
    //            }
    //            Section(header: Text("Photo"))
    //            {
    //                Image(uiImage: self.productImage)
    //                    .resizable()
    //                    .scaledToFit()
    //                    .frame(minWidth: 50, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity, alignment: .center)
    //                    .padding(10)
    //                Button(action: {
    //                    // Select photo from library
    //                    self.photoLibraryShowing = true
    //
    //                })
    //                {
    //                    HStack {
    //                        Spacer()
    //                        Text("Select Photo")
    //                        Spacer()
    //                        Image(systemName: "photo")
    //                        Spacer()
    //                    }
    //                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 50, maxHeight: 70)
    //                    .background(Color.blue)
    //                    .foregroundColor(.white)
    //                    .cornerRadius(20)
    //                    .padding()
    //                }
    //            }
    //            Button(action: {
    //                // Send the new product to the server
    //                uploadOrderWithImage(newOrder: customerOrder, itemImageURLs: [itemImageURL]?)
    //            }, label: {
    //                Text("Create Product")
    //            })
    //        }
    //
    //        .padding()
    //        .sheet(isPresented: $photoLibraryShowing) {
    //            ImagePicker(selectedImage: self.$itemImage, selectedImageURL: self.$itemImageURL, sourceType: .photoLibrary)
    //        }
    //    }
}


    // MARK: - PREVIEW
struct CreateOrderView_Previews: PreviewProvider {
    let imageUrl = URL(string: "")
    static var previews: some View {
        NavigationView { CreateOrderView() }
    }
}
