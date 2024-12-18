import SwiftUI
import SwiftData

struct MainPageView: View {
    
    @Environment(\.modelContext) var context
    @State private var showModal = false // Tracks if modal is showing
    @Query var capsule: [DataItem] // Assumed DataItem is a SwiftData model
    
    var body: some View {
        NavigationStack {
            VStack {
                if capsule.isEmpty {
                    Text("No memories yet")
                } else {
                    ScrollView {
                        ForEach(capsule) { capsuleItem in // Renamed to avoid shadowing
                            NavigationLink(destination: CapsuleDetailView(capsule: capsuleItem)) {
                                CapsuleView(capsule: capsuleItem)
                            }
                        }
                    }
                    
                    .listStyle(InsetGroupedListStyle()) // Optional: Improve appearance
                    
                }
                
            }
            
            .navigationTitle("Your ReCaps")
            .navigationBarItems(
                trailing: Button(action: {
                    showModal = true
                }) {
                    Image(systemName: "plus")
                        .font(.title2) // Icon size
                }
                
                
            )
            
        }
        .sheet(isPresented: $showModal) {
            ModalView(showModal: $showModal) // The content of the modal
        }
        

    }    
}

#Preview {
    MainPageView()
}
