//
//  MainPageView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 09/12/24.
//

import SwiftUI

struct MainPageView: View {
    @State private var showModal = false // Tracks if modal is showing
    
    var body: some View {
        NavigationStack {
            Text("No memories yet")
                .navigationTitle("Your ReCaps")
                .navigationBarItems(
                                    trailing: Button(action: {
                                        showModal = true
                                    }) {
                                        Image(systemName: "plus") // Button's icon
                                            .font(.title2) // Icon size
                                    }
                                )
        }
        .sheet(isPresented: $showModal) {
            ModalView() // The content of the modal
        }

            
        
    }
}
#Preview {
    MainPageView()
}
