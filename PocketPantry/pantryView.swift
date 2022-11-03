import SwiftUI
import Firebase


//class PantryViewModel: ObservableObject {
//    init() {
//        fetchCurrentUser()
//    }
//
//    private func fetchCurrentUser() {
//        guard let uid =
//                DataManager.shared.auth.currentUser?.uid else { return }
//        DataManager
//    }
//}

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
