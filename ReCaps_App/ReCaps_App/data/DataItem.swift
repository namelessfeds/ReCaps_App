//
//  DataItem.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 10/12/24.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    var id: UUID = UUID()
    var capsuleName: String
    var capsuleDescription: String
    var capsuleImage: Data?
    var savedPhotos: [Data] = []
    
    // Relazione uno-a-molti con Photo
    @Relationship(deleteRule: .cascade)
    var photos: [Photo] = []  // Array di foto associate a questo DataItem
    
    init(capsuleName: String, capsuleDescription: String, capsuleImage: Data? = nil, photos : [Data] = []) {
        self.capsuleName = capsuleName
        self.capsuleDescription = capsuleDescription
        self.capsuleImage = capsuleImage
        self.savedPhotos = photos
        
    }
}
