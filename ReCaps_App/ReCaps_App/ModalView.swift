//
//  ModalView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 09/12/24.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("New ReCaps")
            }
            .navigationTitle("New Capsule")
                        .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    
                }) {
                    Text("Back")
                }, trailing: Button(action: {
                    
                }) {
                    Text("Add")
                        .bold()
                })
        }
    }
}

#Preview {
    ModalView()
}
