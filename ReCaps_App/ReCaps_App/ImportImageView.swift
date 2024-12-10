//
//  ImportImageView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 09/12/24.
//

import SwiftUI
import PhotosUI

struct ImportImageView: View {
    @State private var selectedImage: UIImage?
    @State private var isPickerPresented = false

    var body: some View {
        VStack {
            Button(action: {
                isPickerPresented = true
            }) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 250, height: 200)
                        .clipShape(Rectangle())
                        .cornerRadius(30)
            
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .frame(width: 250, height: 200)
                        .clipShape(Rectangle())
                        .cornerRadius(30)
                        .foregroundColor(Color.gray)
                    
                }
            }
            .sheet(isPresented: $isPickerPresented) {
                PhotoPicker(selectedImage: $selectedImage)
            }
        }
    }
}

#Preview {
    ImportImageView()
}
