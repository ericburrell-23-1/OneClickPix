//
//  FindImageFromURL.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/15/23.
//

import SwiftUI

func ImageFromURLString(urlString: String) -> Image {
    do {
        let url = URL(string: urlString)
        let imageData = try Data(contentsOf: url!)
        let uiImage = UIImage(data: imageData)!
        let image = Image(uiImage: uiImage)
        return image
    } catch {
        return Image(systemName: "exclamationmark.square")
    }
}
