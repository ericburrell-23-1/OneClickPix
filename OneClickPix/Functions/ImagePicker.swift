//
//  ImagePicker.swift
//  OneClickPix
//
//  Created by Eric Burrell on 2/7/23.
//

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage
    @Binding var selectedImageURL: URL?
    @Environment(\.dismiss) private var dismiss
 
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
 
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
 
        return imagePicker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
        var parent: ImagePicker
     
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let previewImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
                parent.selectedImage = previewImage
            }
            if let imageURL = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerImageURL")] as? URL {
                parent.selectedImageURL = imageURL
            }
            // print("\(info)")
            parent.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
