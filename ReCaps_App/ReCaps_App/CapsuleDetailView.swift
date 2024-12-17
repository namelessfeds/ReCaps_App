//
//  CapsuleDetailView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 11/12/24.
//


import SwiftUI

struct CapsuleDetailView: View {
    
    @Environment(\.modelContext) var context

    
    var image = "seashore"
    var capsule: DataItem
    
    var body: some View {
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
            VStack{
                ImageGridView()
            }
            
        }
    }
}

#Preview {
    CapsuleDetailView(capsule: DataItem(
        capsuleName: "Ancona",
        capsuleDescription: "Golden beaches, spectacular sunsets and fresh fish every night. I walked along the seafront, listened to the waves and discovered hidden corners. It was short, but refreshing.",
        capsuleImage: Data()))
}
