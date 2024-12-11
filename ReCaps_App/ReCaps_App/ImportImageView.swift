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
        ZStack {
            Button(action: {
                isPickerPresented = true
            }) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 350, height: 170)
                        .clipShape(Rectangle())
                        .cornerRadius(30)
                        .padding(.all, 10)
                } else {
                    ZStack {
                        Rectangle()
                            .frame(width: 350, height: 170)
                            .cornerRadius(25)
                            .foregroundStyle(Color(.systemGray6))
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 31.75, height: 25)
                            .clipShape(Rectangle())
                            .cornerRadius(3.5)
                            .foregroundColor(Color.gray)
                            .opacity(0.9)
                            .padding(.all, 10)
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 23))
                            }
                        }
                        .padding()
                            
                    }.frame(width: 170, height: 170)
                   
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
