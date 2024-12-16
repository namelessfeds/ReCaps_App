//
//  GridView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 13/12/24.
//

import SwiftUI
import SwiftData

struct ImageGridView: View {
    @Environment(\.modelContext) private var context
    @State private var dataItem : DataItem?
    @State private var isPickerPresented = false
    
    @State private var selectedImage: UIImage? = nil
   // @State private var isButtonPressed = false
    
    var body: some View {
        
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
                imageFunc.addPhotosToDataItem(dataItem: dataItem!, image: selectedImage!)
            }
        }
        .sheet(isPresented: $isPickerPresented) {
            PhotoPicker(selectedImage: $selectedImage)
        }
        
        
        /* VStack {
            ScrollView {
                HStack(alignment: .top, spacing: 8) {
                    // Prima colonna
                        Button(action: {
                            print("Bottone premuto!")
                        }) {
                            Text("Aggiungi")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 250)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                            ForEach(dataItem?.photos ?? [], id: \.id) { photo in
                                if let image = UIImage(data: photo.imageData) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                }
                            }
                        }
                        .padding()
                        /*ForEach(images.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }, id: \.self) { imageName in
                         ImageButton(imageName: imageName, selectedImage: $selectedImage, showFullScreen: $showFullScreen)
                         */
                    }
                }
            }
            .padding(8)
        }

    }


struct ImageButton: View {
    let imageName: String
    @Binding var selectedImage: UIImage?
    @Binding var showFullScreen: Bool
    
    var body: some View {
        if let uiImage = UIImage(named: imageName) {
            Button(action: {
                selectedImage = uiImage
                showFullScreen = true
            }) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(4)
            }
            .buttonStyle(PlainButtonStyle())
        } else {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 150)
        }
    }
}

struct FullScreenImageView: View {
    let image: UIImage
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(8)
            }
            .padding()
        }
         */
        
    }
}

         
        
#Preview {
    ImageGridView()
}
