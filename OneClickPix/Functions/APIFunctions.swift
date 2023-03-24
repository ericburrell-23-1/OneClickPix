//
//  APIFunctions.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/7/23.
//

import SwiftUI
import Alamofire

//func uploadForm(newProduct: product) {
//    AF.upload(multipartFormData: { multipartFormData in
//        multipartFormData.append(Data(newProduct.name.utf8), withName: "name")
//        multipartFormData.append(Data(newProduct.description.utf8), withName: "description")
//        if newProduct.productGroups[0] != "" {
//            newProduct.productGroups.enumerated().forEach({ (index, productGroup) in
//                multipartFormData.append(Data(productGroup.utf8), withName: "productGroups[\(index)]")
//            })
//        }
//        if newProduct.productGroups[0] != "" {
//            newProduct.productGroups.enumerated().forEach({ (index, productGroup) in
//                multipartFormData.append(Data(productGroup.utf8), withName: "productGroups[\(index)]")
//            })
//        }
//
//    }, to: "http://10.0.0.111:3000/api/offerings/products", method: .post, headers: ["x-auth-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2M2RhZGNkZjMyZDI2YzUwOGY3NzIxY2MiLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE2NzU2NDU2NzB9.gcpJ1lqhY_ItfNo3lxfrNXBe4n2tfIeB0rD4Z39Pt4U"])
//    .responseString { res in
//        print(res.value!)
//    }
//    .resume()
//}

func uploadFormWithImage(newProduct: Product, productImageURL: URL?) {
    AF.upload(multipartFormData: { multipartFormData in
        if productImageURL != nil {
            multipartFormData.append((productImageURL ?? URL(string: "")!), withName: "image")
        }
        multipartFormData.append(Data(newProduct.name.utf8), withName: "name")
        multipartFormData.append(Data(newProduct.description.utf8), withName: "description")
        if newProduct.productGroups[0] != "" {
            newProduct.productGroups.enumerated().forEach({ (index, productGroup) in
                multipartFormData.append(Data(productGroup.utf8), withName: "productGroups[\(index)]")
            })
        }
        if newProduct.productGroups[0] != "" {
            newProduct.productGroups.enumerated().forEach({ (index, productGroup) in
                multipartFormData.append(Data(productGroup.utf8), withName: "productGroups[\(index)]")
            })
        }
        
    }, to: "http://10.0.0.111:3000/api/offerings/products", method: .post, headers: ["x-auth-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2M2RhZGNkZjMyZDI2YzUwOGY3NzIxY2MiLCJpc0FkbWluIjp0cnVlLCJpYXQiOjE2NzU2NDU2NzB9.gcpJ1lqhY_ItfNo3lxfrNXBe4n2tfIeB0rD4Z39Pt4U"])
    .responseString { res in
        print(res.value!)
    }
    .resume()
}

//func uploadOrderWithImage(newOrder: Order, itemImageURLs: [URL?]) {
//    AF.upload(multipartFormData: { multipartFormData in
//        for url in itemImageURLs {
//            multipartFormData.append(url!, withName: "image")
//        }
//        for (index, item) in newOrder.items.enumerated() {
//            let orderJSON = try! JSONEncoder().encode(item)
//            // Try iterating through each property of "item" instead
//            print(String(bytes: orderJSON, encoding: .utf8)!)
//            multipartFormData.append(orderJSON, withName: "items[\(index)]")
//        }
//
//    }, to: "http://\(serverIP)/api/clients/orders", method: .post, headers: ["x-auth-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2M2RiNDRkMmJhNDM1OGFhZTA2ODliNzgiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjc1OTg3MDA2fQ.XnQcj8_g0BSh21SlpkJFTN0lz12owcmITRdXopUrVc0", "shipping-address-index": "0"])
//    .responseString { res in
//        print(res.value!)
//    }
//    .resume()
//}

//func getData(forEndpoint endpoint: String, completionHandler: @escaping ([String]) -> Void) {
//    getImageNames(forEndpoint: endpoint, completion: completionHandler)
//}

func getImageNames(forEndpoint endpoint: String) async {//, completion: @escaping ([String]) -> Void) {
        AF.request("http://\(serverIP)\(endpoint)")
            .responseDecodable(of: [String].self) { response in
                let imageNames = response.value ?? []
                //completion(imageNames)
                coverImageNames = imageNames
            }
}

func addToCart(item: Item, _ callback: @escaping (_ newCartTotal: Int) -> Void) {
    AF.request("http://\(serverIP)/api/clients/cart/add-to-cart",
               method: .put,
               parameters: item, encoder: JSONParameterEncoder.default)
    .responseString { response in
        print(response.value ?? "Response could not be found")
        print("Cart message: ", response.response?.headers["x-cart-message"] ?? "No message found")
    }
    .responseDecodable(of: Cart.self) { response in
        callback(response.value?.totalItemQuantity ?? 0)
    }
    .resume()
}

func loadCart(_ callback: @escaping (_ decoded: Cart) -> Void) async {
    AF.request("http://\(serverIP)/api/clients/cart")
        .responseDecodable(of: Cart.self) { response in
            callback(response.value!)
        }
        .resume()
}

// http://10.0.0.111:3000/api/clients/orders

// "http://\(serverIP)/api/clients/cart/add-to-cart"

// https://postman-echo.com/post
