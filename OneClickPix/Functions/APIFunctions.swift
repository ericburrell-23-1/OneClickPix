//
//  APIFunctions.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/7/23.
//

import SwiftUI
import Alamofire


// MARK: - RETRIEVE AN IMAGE
func getImage(fromAPIEndpoint urlString: String, _ completionHandler: @escaping (_ uiimage: UIImage) -> Void) {
    AF.request(urlString).responseData { responseImage in
        if let imageData = responseImage.data {
            if let image = UIImage(data: imageData) {
                completionHandler(image)
            } else {
                print("Image could not be built from data found at \(urlString)")
            }
        } else {
            print("Image Data not found at \(urlString)")
        }
    }
}

// MARK: - PRODUCT/MARKETING LISTS
func getCoverImageNames(_ completionHandler: @escaping (_ imageNames: [String]) -> Void) {
    AF.request("http://\(serverIP)/api/offerings/marketing/coverImages")
        .responseDecodable(of: [String].self) { response in
            if let imageNames = response.value {
                completionHandler(imageNames)
                print("Cover Image Names retrieved!")
            } else {
                print("Could not access cover image names: ", response.error ?? "Unknown Error")
            }
        }
}

func getProductList(_ completionHandler: @escaping (_ products: [Product]) -> Void) {
    AF.request("http://\(serverIP)/api/offerings/products")
        .responseDecodable(of: [Product].self) { response in
            if let productList = response.value {
                completionHandler(productList)
                print("Product List retrieved!")
            } else {
                print("Could not recieve product list: ", response.error ?? "Unknown Error")
            }
        }
}

func getProductGroups(_ completionHandler: @escaping (_ productGroups: [ProductGroup]) -> Void) {
    AF.request("http://\(serverIP)/api/offerings/productGroups")
        .responseDecodable(of: [ProductGroup].self) { response in
            if let productGroups = response.value {
                completionHandler(productGroups)
                print("Product Groups retrieved!")
            } else {
                print("Could not recieve product groups: ", response.error ?? "Unknown Error")
            }
        }
}


// MARK: - CART
func addToCart(item: Item, _ completionHandler: @escaping (_ decoded: Cart) -> Void) {
    AF.request("http://\(serverIP)/api/clients/cart/add-to-cart",
               method: .put,
               parameters: item, encoder: JSONParameterEncoder.default)
    .responseString { response in
        print(response.value ?? "Response could not be found")
        print("Cart message: ", response.response?.headers["x-cart-message"] ?? "No message found")
    }
    .responseDecodable(of: Cart.self) { response in
        completionHandler(response.value ?? emptyCart)
    }
    .resume()
}

func loadCart(_ completionHandler: @escaping (_ decoded: Cart) -> Void) async {
    AF.request("http://\(serverIP)/api/clients/cart")
        .responseDecodable(of: Cart.self) { response in
            completionHandler(response.value ?? emptyCart)
            print("Cart message: ", response.response?.headers["x-cart-message"] ?? "No message found")
        }
        .resume()
}

func clearCart(_ completionHandler: @escaping (_ decoded: Cart) -> Void) {
    AF.request("http://\(serverIP)/api/clients/cart/clear-cart", method: .delete)
        .responseDecodable(of: Cart.self) { response in
            completionHandler(response.value ?? emptyCart)
            print("Cart message: ", response.response?.headers["x-cart-message"] ?? "No message found")
        }
        .resume()
}

