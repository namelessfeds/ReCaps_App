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
    
    @Attribute
    var galleria: [UUID] = []
     
    
    init(capsuleName: String, capsuleDescription: String, capsuleImage: Data?) {
        self.capsuleName = capsuleName
        self.capsuleDescription = capsuleDescription
        self.capsuleImage = capsuleImage
    }
}
