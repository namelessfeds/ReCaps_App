//
//  MainPageView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 09/12/24.
//

import SwiftUI
import SwiftData

struct MainPageView: View {
    @State private var showModal = false // Tracks if modal is showing
    @Query private var capsule: [DataItem]
    
    var body: some View {
        NavigationStack {
            VStack {
                if capsule.isEmpty {Text("No memories yet")}
                else {
                    ScrollView {
                        ForEach(capsule) { capsule in
                            CapsuleView(capsule: capsule)
                        }
                    }
                }
            }
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
            ModalView(showModal : $showModal) // The content of the modal
        }
    }
}

#Preview {
    MainPageView()
}
