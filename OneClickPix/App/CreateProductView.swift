//
//  CreateProductView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/6/23.
//

import SwiftUI
import Alamofire

//struct CreateProductView: View {
//    // MARK: - PROPERTIES
//    @State private var photoLibraryShowing = false
//    @State var newProduct: Product = Product(_id: "", name: "", description: "", imageName: "", productGroups: [""], productSizes: [""], priceList: [])
//    @State var productImage: UIImage = UIImage(systemName: "photo")!
//    @State var productImageURL: URL? = nil
//    
//    // MARK: - BODY
//    var body: some View {
//        //ScrollView {
//            Form {
//                Section(header: Text("Product Details")) {
//                    AnimatedTextFieldView(placeholderText: "Product Name", inputValue: $newProduct.name, isRequired: true)
//                    
//                    AnimatedTextFieldView(placeholderText: "Product Description", inputValue: $newProduct.description, isRequired: true)
//                    
//                    AnimatedTextFieldView(placeholderText: "Product Groups", inputValue: $newProduct.productGroups[0])
//                    
//                    AnimatedTextFieldView(placeholderText: "Product Sizes", inputValue: $newProduct.productSizes[0])
//                }
//                Section(header: Text("Photo"))
//                {
//                    Image(uiImage: self.productImage)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity, alignment: .center)
//                        .padding(10)
//                    Button(action: {
//                        // Select photo from library
//                        self.photoLibraryShowing = true
//                        
//                    }) {
//                        HStack {
//                            Spacer()
//                            Text("Select Photo")
//                            Spacer()
//                            Image(systemName: "photo")
//                            Spacer()
//                        }
//                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 50, maxHeight: 70)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(20)
//                        .padding()
//                    }
//                }
//                Button(action: {
//                    // Send the new product to the server
//                    uploadFormWithImage(newProduct: newProduct, productImageURL: productImageURL)
//                }, label: {
//                    Text("Create Product")
//                })
//            }
//        
//            .padding()
//            .sheet(isPresented: $photoLibraryShowing) {
//                ImagePicker(selectedImage: self.$productImage, selectedImageURL: self.$productImageURL, sourceType: .photoLibrary)
//            }
//    }
//}
//
//    // MARK: - PREVIEW
//struct CreateProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            TabView {
//                CreateProductView(productImageURL: URL(string: "")!) }
//            .tabItem {
//                Image(systemName: "bag.circle.fill")
//                Text("Product")
//            }
//            .navigationTitle("New Product")
//        }
//    }
//}
