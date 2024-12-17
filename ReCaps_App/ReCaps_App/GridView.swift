//
//  GridView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 17/12/24.
//

import SwiftUI
import SwiftData

struct GridView: View {
    @Environment(\.modelContext) private var context
    @Query var dataItems: [DataItem]
    @State private var dataItem: DataItem?

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                
                ImageGridView()
                if let photos = dataItem?.photos {
                    ForEach(photos, id: \.id) { photo in
                        if let image = UIImage(data: photo.imageData) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                } else {
                    Text("No photos available")
                }
            }
        }
        .onAppear {
            loadDataItem()
        }
    }

    private func loadDataItem() {
        let fetchDescriptor = FetchDescriptor<DataItem>()
        do {
            let items = try context.fetch(fetchDescriptor)
            self.dataItem = items.first
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    GridView()
}
