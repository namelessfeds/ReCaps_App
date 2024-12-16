//
//  ReCaps_AppApp.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 09/12/24.
//

import SwiftUI
import SwiftData

@main
struct ReCaps_AppApp: App {
    var body: some Scene {
        WindowGroup {
            MainPageView()
        }
        .modelContainer(for: DataItem.self)
        .modelContainer(for: Photo.self)
    }
}
