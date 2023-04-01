//
//  CoverImagesModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/28/23.
//

import Foundation

class CoverImages: ObservableObject {
    @Published var names: [String] = []
    @Published var loadedAtStartup: Bool = false
}
