//
//  GridView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 13/12/24.
//

import SwiftUI
import PhotosUI
import SwiftData
import SwiftUI
import SwiftData
import PhotosUI

struct ImageGridView: View {
    @Environment(\.modelContext) private var context
    @State private var dataItem : DataItem?
    @State private var photoItem : Photo?
    @State private var isPickerPresented = false
    
    @State private var selectedImage : PhotosPickerItem?
    @State private var selectedImageData : Data?
    
    func addPhoto() {
        // Create the item
        let selectedPhoto = Photo(imageData: selectedImageData!, parentDataItem: dataItem)
        print("funziona cazzo")
        context.insert(selectedPhoto)
    }
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $selectedImage,
                         matching: .images, photoLibrary: .shared()) {
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .cornerRadius(25)
                        .foregroundStyle(Color(.systemGray6))
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 25, height: 20)
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
                                .font(.system(size: 18))
                                .frame(width: 40, height: 35)
                        }
                    }
                
                    
                }.frame(width: 100, height: 100)
                
            }
        }
        .task(id: selectedImage) {
            if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                selectedImageData = data
                addPhoto()
            }
        }
    }
}

#Preview {
    ImageGridView()
}
