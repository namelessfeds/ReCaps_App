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
    @Query var item: [DataItem]
    var image = "seashore"
    var capsule: DataItem
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ZStack{
                        if let imageData = capsule.capsuleImage,
                           let uiImage = UIImage(data: imageData) {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.clear)
                                .overlay(
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity)
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
                        VStack(alignment: .leading, spacing: 10) {
                            VStack(alignment: .center){
                                Text(capsule.capsuleName)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .bold()
                                    .textCase(.uppercase)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity)
                            VStack(alignment: .center){
                                Text(capsule.capsuleDescription)
                                    .font(.system(size: 18))
                            }
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                Text("rb4t")
                            }
                            
                            
                        }
                        .padding(20)
                        .background(Color.white
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)))
                        .frame(maxWidth: .infinity)
                        .offset(y: 140)
                    }
                    
                }
            }
            
        }
    }
}

#Preview {
    CapsuleDetailView(capsule: DataItem(capsuleName: "Ancona", capsuleDescription: "Golden beaches, spectacular sunsets and fresh fish every night. I walked along the seafront, listened to the waves and discovered hidden corners. It was short, but refreshing.", capsuleImage: Data()))
}
