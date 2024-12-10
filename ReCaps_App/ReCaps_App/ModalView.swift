//
//  ModalView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 09/12/24.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var showModal: Bool
    
    @State private var capsuleName: String = ""           // Tracks the Capsule Name
    @State private var capsuleDescription: String = ""    // Tracks the Description
    
    
    var body: some View {
        
        NavigationStack {
           
            // Text Fields
            VStack(spacing: 16) {
                ImportImageView()
                                TextField("Capsule Name", text: $capsuleName)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(8)
                                    .bold()

                                TextField("Description (optional)", text: $capsuleDescription)
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
                    showModal = false
                }) {
                    Text("Add")
                        .bold()
                })
            
        }

    }
}

#Preview {
    ModalView(showModal : .constant(true))
}
