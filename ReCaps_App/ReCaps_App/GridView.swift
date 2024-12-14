//
//  GridView.swift
//  ReCaps_App
//
//  Created by Federica Bertini on 13/12/24.
//

import SwiftUI
import SwiftData

struct GridView: View {

    var body: some View {
        
        NavigationStack{
            VStack {
                ScrollView{
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20){
                        
                    
                    }
                }
                       
                }
            }
        }
    }

        
#Preview {
    GridView()
        }
