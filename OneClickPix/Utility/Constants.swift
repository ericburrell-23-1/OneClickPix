//
//  Constants.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/21/23.
//

import SwiftUI
import Alamofire

// DATA

var coverImageNames: [String] = ["photoGifts.png", "restoration.png", "wallDecor.png"]
let productGroups: [ProductGroup] = [
    ProductGroup(_id: "1", name: "Classic Prints", description: "Get professionally printed photographs on the highest quality Kodak photographic paper, with a variety of finishing options sure to make your image pop!", image: "polaroids.png"),
    ProductGroup(_id: "2", name: "Canvas Wraps", description: "Hardback Canvas Wraps are made from professional photographic paper, and come with a variety of finishing options. These are great to hang on the wall and serve as a centerpiece in any room.", image: "canvasWraps.png"),
    ProductGroup(_id: "3", name: "Mounts", description: "Beveled masonite and stand out mounts are great to hang on the wall or put on an easel!", image: "standouts.png"),
    ProductGroup(_id: "4", name: "Posters", description: "Our professional finishing options include mounting on various substrates and adding a lacquer spray to protect your photo from sticking to frame glass, from water damage, and from scratching.", image: "posters.png"),
    ProductGroup(_id: "5", name: "Home & Office", description: "Everything from photo plaques and tiles, to blankets and tote bags. Functional and decorative!", image: "blanket.png"),
    ProductGroup(_id: "6", name: "Small & portable", description: "Magnets, buttons, and keychains: use your favorite photos to hang or to take with you.", image: "keychain.png"),
    ProductGroup(_id: "7", name: "Stationery", description: "Sheets of photo stickers to use anywhere you want to stick your pic, or notepads to add some personalization to taking notes!", image: "stationery.png"),
    ProductGroup(_id: "8", name: "Drinkables", description: "Mugs, tumblers, and bottles, to take your favorite photos along with your favorite drinks!", image: "drinkables.png")
]

// COLOR

let colorBackground: Color = Color("ColorBackground")
let colorLightGray: Color = Color(UIColor.lightGray)
let colorDarkGray: Color = Color(UIColor.darkGray)

// LAYOUT

let columnSpacing: CGFloat = 30
let rowSpacing: CGFloat = 25
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// UX

// API

let serverIP: String = "10.0.0.111:3000"

// IMAGE

// FONT

// STRING

// MISC

let topSafeAreaPaddingLength = UIApplication
    .shared
    .connectedScenes
    .compactMap { ($0 as? UIWindowScene)?.keyWindow }
    .first?
    .safeAreaInsets
    .top

