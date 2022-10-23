import SwiftUI

struct pantryView: View {
    @StateObject private var pantryViewModel = PantryViewModel()
    
    var body: some View {
        NavigationView {
            //var pantry = pantryViewModel.pantries[0]
            VStack(alignment: .leading) {
                Text("Pantry").font(.title3).bold()
            }
            Spacer()
//            List(pantry.foods) { food in
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text(food.name).font(.caption)
//                        Text(food.date_added)
//                    }
//                }
//            }
            .navigationTitle("My Pantry")
        } .onAppear {
            pantryViewModel.readPantryData()
        }
//        .onDisappear {
//            pantryViewModel.stopListening()
//        }
    }
}

struct pantryView_Previews: PreviewProvider {
    static var previews: some View {
        pantryView()
    }
}
