//
//  CapsuleView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 10/12/24.
//

import SwiftUI

struct CapsuleView: View {
    var capsule: DataItem
    var image = "seashore"
    var body: some View {
        ZStack(alignment: .bottomLeading) { // Allinea gli elementi in basso a sinistra
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.clear)
                .frame(height: 246)
                .overlay(
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 246)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.6)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        )
                        .padding()
                )
            
            VStack(alignment: .leading) { // Testi allineati a destra
                Text(capsule.capsuleName) // Usa il nome dal modello
                    .font(.title)
                    .bold()
                Text(capsule.capsuleDescription) // Usa la descrizione dal modello
                    .font(.subheadline)
            }
            .padding(.leading, 35)
            .padding(.bottom, 20) // spazio dal bordo
            .foregroundColor(.white)
        }
    }
}

#Preview {
    CapsuleView(capsule: DataItem(capsuleName: "Barcelona", capsuleDescription: "We had a lot of fun", capsuleImage: Data()))
}
