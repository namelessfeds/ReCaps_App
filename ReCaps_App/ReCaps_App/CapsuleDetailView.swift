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
    @State private var isSheetPresented = true
    @Query var item: [DataItem]
    
    var image = "seashore"
    var capsule: DataItem
    
    var body: some View {
        
        NavigationStack{
            if let imageData = capsule.capsuleImage,
               let uiImage = UIImage(data: imageData) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.clear)
                    .overlay(
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .clipped()
                            .ignoresSafeArea()
                    )
            }
            else {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .ignoresSafeArea()
            }
            
            
        } .sheet(isPresented: $isSheetPresented) {
            VStack{
                Text(capsule.capsuleName)
                    .font(.title)
                    .bold()
                    .textCase(.uppercase)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(capsule.capsuleDescription)
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                ImageGridView()
            }.padding()
            .presentationDetents([.medium])
            .presentationDragIndicator(.hidden)
            .interactiveDismissDisabled()
        }
    
    
    }
}


#Preview {
    CapsuleDetailView(capsule: DataItem(capsuleName: "Ancona", capsuleDescription: "Golden beaches, spectacular sunsets and fresh fish every night. I walked along the seafront, listened to the waves and discovered hidden corners. It was short, but refreshing.", capsuleImage: Data()))
}
