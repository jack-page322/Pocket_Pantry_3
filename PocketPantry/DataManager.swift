//
//  DataManager.swift
//  PocketPantry
//
//  Created by Anika Hamby on 10/26/22.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var foods: [Food] = []
    
    init() {
        fetchFoods()
    }

    func fetchFoods() {
        foods.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Foods")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let brand = data["brand"] as? String ?? ""
                    
                    let food = Food(id: id, name: name, brand: brand, category: category)
                    
                    print("Fetched food: \(food.name)")
                    
                    self.foods.append(food)
                }
            }
        }
    }
    
    func addFood(name: String, category: String, brand: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Foods").document(name)
        let id = ref.documentID
        ref.setData(["id": id, "name": name, "category": category, "brand": brand]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
