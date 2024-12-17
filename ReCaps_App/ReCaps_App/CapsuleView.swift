//
//  CapsuleView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 10/12/24.
//

import SwiftUI

struct CapsuleView: View {
    
    @Environment(\.modelContext) var context
    var capsule: DataItem
    var image = "seashore"
    var body: some View {
        HStack {
            ZStack(alignment: .bottomLeading) { // Allinea gli elementi in basso a sinistra
                if let imageData = capsule.capsuleImage,
                   let uiImage = UIImage(data: imageData) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.clear)
                        .frame(height: 246)
                        .overlay(
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 246)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .padding()
                        )
    
                }
                
                else {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 370, height: 246)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
                VStack(alignment: .leading) { // Testi allineati a destra
                    Text(capsule.capsuleName) // Usa il nome dal modello
                        .font(.title)
                        .bold()
                    Text(capsule.capsuleDescription) // Usa la descrizione dal modello
                        .font(.subheadline)
                }
                .padding(.leading, 35)
                .padding(.bottom, 35) // spazio dal bordo
                .foregroundColor(.white)
            }
        }
    }
}


#Preview {
    CapsuleView(capsule: DataItem(capsuleName: "Barcelona", capsuleDescription: "We had a lot of fun", capsuleImage: Data()))
}

