//
//  CapsuleDetailView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 11/12/24.
//


import SwiftUI
import SwiftData

struct CapsuleDetailView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    
    var image = "seashore"
    var capsule: DataItem
    var testColor: Color = Color("Test")
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ZStack(alignment: .bottom){
                    GeometryReader { geometry in
                        if let imageData = capsule.capsuleImage,
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 300)
                                .clipped()
                        } else {
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 300)
                                .clipped()
                        }
                    }
                    .frame(height: 300) // Altezza dell'immagine
                    VStack{
                        Text(capsule.capsuleName)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)   .textCase(.uppercase)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(capsule.capsuleDescription)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding()
                }
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 160), spacing: 8)],
                    spacing: 8
                )
                {
                    ForEach(capsule.savedPhotos, id: \.self){ photo in
                        if let uiImage = UIImage(data: photo){
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                    
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        context.delete(capsule)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Delete")
                    }
                }
            }
            .background(Color(UIColor.systemGray6))
        }
    }
}

#Preview {
    CapsuleDetailView(capsule: DataItem(
        capsuleName: "Ancona",
        capsuleDescription: "Golden beaches, spectacular sunsets and fresh fish every night. I walked along the seafront, listened to the waves and discovered hidden corners. It was short, but refreshing.",
        capsuleImage: Data(), photos: []))
}

