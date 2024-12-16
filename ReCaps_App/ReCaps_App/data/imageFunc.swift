//
//  imageFunc.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 16/12/24.
//

import SwiftData
import SwiftUI

class imageFunc {
    
    func addPhotosToDataItem(images: [UIImage], dataItem: DataItem, context: ModelContext) {
        for image in images {
            // Converti UIImage in Data
            guard let imageData = image.jpegData(compressionQuality: 1.0) else {
                print("Errore nella conversione dell'immagine in Data")
                continue
            }
            
            // Crea una nuova Photo e collegala al DataItem
            let photo = Photo(imageData: imageData, parentDataItem: dataItem)
            
            // Aggiungi la Photo all'array di foto del DataItem
            dataItem.photos.append(photo)
            
            // Inserisci la Photo nel contesto Swift Data
            context.insert(photo)
        }

        // Salva il contesto
        do {
            try context.save()
            print("Foto aggiunte con successo a \(dataItem.capsuleName)")
        } catch {
            print("Errore durante il salvataggio: \(error.localizedDescription)")
        }
    }


    func fetchPhotos(for dataItem: DataItem) -> [UIImage] {
        return dataItem.photos.compactMap { photo in
            UIImage(data: photo.imageData)
        }
    }
}
