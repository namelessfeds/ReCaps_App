//
//  Photo.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 16/12/24.
//

import SwiftUI
import SwiftData

@Model
class Photo: Identifiable {
    var id: UUID = UUID()
    var imageData: Data
    var parentDataItem: DataItem?  // Riferimento al parent DataItem

    init(imageData: Data, parentDataItem: DataItem? = nil) {
        self.imageData = imageData
        self.parentDataItem = parentDataItem
    }
}
