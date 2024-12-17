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
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ZStack(alignment: .bottom){
                    
                    if let imageData = capsule.capsuleImage,
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .ignoresSafeArea()
                            .frame(maxWidth: .infinity, maxHeight: 400)
                        
                    }
                    
                    else {
                        Image(image)
                            .resizable()
                            .ignoresSafeArea()
                            .frame(maxWidth: .infinity, maxHeight: 400)
                    }
                    
                    VStack{
                        Text(capsule.capsuleName)
                            .font(.title)
                            .bold()
                            .textCase(.uppercase)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .colorInvert()
                        Text(capsule.capsuleDescription)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .colorInvert()
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(1), Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                }
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10)
                {
                    ForEach(capsule.savedPhotos, id: \.self){ photo in
                        if let uiImage = UIImage(data: photo){
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
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
        }
    }
}

#Preview {
    CapsuleDetailView(capsule: DataItem(
        capsuleName: "Ancona",
        capsuleDescription: "Golden beaches, spectacular sunsets and fresh fish every night. I walked along the seafront, listened to the waves and discovered hidden corners. It was short, but refreshing.",
        capsuleImage: Data(), photos: []))
}

