//
//  MarketingMaterialsModel.swift
//  OneClickPix
//
//  Created by Eric Burrell on 3/28/23.
//

import SwiftUI
import Alamofire

class MarketingMaterials: ObservableObject {
    // MARK: - PROPERTIES
    @Published var coverImageNames: [String] = []
    @Published var coverImages: [UIImage] = []
    @Published var loadedAtStartup: Bool = false
    
    // MARK: - INIT
    init() {
        getCoverImageNames { imageNames in
            self.coverImageNames = imageNames
            for coverImageName in self.coverImageNames {
                getImage(fromAPIEndpoint: "http://\(serverIP)/images/marketing/coverImages/\(coverImageName)") { image in
                    self.coverImages.append(image)
                }
            }
            self.loadedAtStartup = true
        }
    }
}
