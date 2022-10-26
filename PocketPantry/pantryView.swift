import SwiftUI
import Firebase

struct pantryView: View {
    //@StateObject private var pantryViewModel = PantryViewModel()
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            List(dataManager.foods, id: \.id) { food in
                Text(food.name)
            }
            .navigationTitle("My Pantry")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup) {
                newFoodView()
            }
        }
    }
}

struct pantryView_Previews: PreviewProvider {
    static var previews: some View {
        pantryView()
            .environmentObject(DataManager())
    }
}
