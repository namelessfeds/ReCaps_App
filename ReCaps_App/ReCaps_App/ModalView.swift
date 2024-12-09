//
//  ModalView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 09/12/24.
//

import SwiftUI

struct ModalView: View {
    @Binding var showModal: Bool
    var body: some View {
        NavigationStack {
            VStack {
                Text("New ReCaps")
            }
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
