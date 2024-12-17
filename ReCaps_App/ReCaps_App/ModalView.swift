//
//  ModalView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 09/12/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct ModalView: View {
    
    @Binding var showModal: Bool
    
    @State private var capsuleName: String = ""           // Tracks the Capsule Name
    @State private var capsuleDescription: String = ""    // Tracks the Description
    @State private var capsuleImageData: Data?
    @State private var capsuleImage: PhotosPickerItem?
    
    @Environment(\.modelContext) private var context // Import data
    
    func addCapsule() {
        // Create the item
        let capsule = DataItem(capsuleName: capsuleName, capsuleDescription: capsuleDescription, capsuleImage: capsuleImageData, photos: [])
        context.insert(capsule)
    }
    
    var body: some View {
        
        NavigationStack {
           
            // Text Fields
            VStack(spacing: 16) {
                PhotosPicker(selection: $capsuleImage,
                             matching: .images, photoLibrary: .shared()) {
                    if let image = capsuleImageData {
                        let uiImage = UIImage(data: image)
                        Image(uiImage: uiImage!)
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
                                TextField("Capsule Name", text: $capsuleName)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(8)
                                    .bold()

                                TextField("Description", text: $capsuleDescription)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(8)
                            }
                            .padding([.leading, .trailing], 20)
                            
            Spacer() // Pushes content to the top
            .navigationTitle("New Capsule")
                        .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    showModal = false
                }) {
                    Text("Back")
                }, trailing: Button(action: {
                    addCapsule()
                    showModal = false
                }) {
                    Text("Add")
                        .bold()
                })
            
        }
        .task(id: capsuleImage) {
            if let data = try? await capsuleImage?.loadTransferable(type: Data.self) {
                capsuleImageData = data
            }
        }


    }
}

#Preview {
    ModalView(showModal : .constant(true))
}
