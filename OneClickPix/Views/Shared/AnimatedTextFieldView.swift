//
//  AnimatedTextFieldView.swift
//  OneClickPix
//
//  Created by Eric Burrell on 11/1/22.
//

import SwiftUI

struct AnimatedTextFieldView: View {
    // MARK: - PROPERTIES
    let placeholderText: String
    @Binding var inputValue: String
    var isRequired: Bool = false

    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Text(placeholderText)
                    .foregroundColor(inputValue.isEmpty ? Color(UIColor.placeholderText) : .accentColor)
                Text(isRequired ? "*" : "")
                    .foregroundColor(Color.red)
            }
            .offset(y: inputValue.isEmpty ? -7 : -25)
            .scaleEffect(inputValue.isEmpty ? 1 : 0.8, anchor: .leading)
            
            TextField("", text: $inputValue)
                .offset(y: inputValue.isEmpty ? -7 : 0)
        }
        .padding(.top, 15)
        .animation(.default, value: inputValue.isEmpty)
    }
}

    // MARK: - PREVIEW
struct AnimatedTextFieldView_Previews: PreviewProvider {
    //@State static var value = ""
    static var previews: some View {
        Form {
            Section(header: Text("Image Details")) {
                AnimatedTextFieldView(placeholderText: "Image Name", inputValue: .constant(""), isRequired: true)
                    .previewLayout(.sizeThatFits)
                    .padding()
            }
        }
    }
}
