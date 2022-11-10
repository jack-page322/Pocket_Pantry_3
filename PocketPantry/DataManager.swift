//
//  DataManager.swift
//  PocketPantry
//
//  Created by Anika Hamby on 10/26/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class DataManager: ObservableObject {
    @Published var foods: [Food] = []
<<<<<<< Updated upstream
    
    init() {
        fetchFoods()
=======
    @Published var pantry: [PantryFood] = []
    @State var uid = ""
    
    let auth: Auth
    let db: Firestore
    
    init(){
        self.db = Firestore.firestore()
        self.auth = Auth.auth()
    }
    
    func setUID(with uid: String){
        self.uid = uid
        
        // try fetching the user's pantry
        fetchUserPantry()
    }
    
    func createEmptyPantry(with uid: String){
        let ref = db.collection("Pantries").document(uid).collection("foods").document("default")
        ref.setData(["name": NSNull(), "brand": NSNull(), "category":NSNull(), "date":NSNull(), "expiration":NSNull(), "icon":NSNull()]) { error in
            if let error = error {
                print("Couldn't create pantry")
                print(error.localizedDescription)
            }
        }
        
    }
        
    func fetchUserPantry() {
        print(uid)
        pantry.removeAll()
        let ref = db.collection("Pantries").document(uid).collection("foods")
        ref.getDocuments() { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let name = data["name"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let brand = data["brand"] as? String ?? ""
                    let expiration = data["expiration"] as? String ?? ""
                    let dateAdded = data["date"] as? String ?? ""
                    let icon = data["icon"] as? String ?? ""
                    
                    let pantryFood = PantryFood(id: document.documentID, name: name, brand: brand, dateAdded: dateAdded, category: category, expiration: expiration, icon: icon)
                    
                    print("Fetched pantry item: \(pantryFood.name)")
                    
                    if pantryFood.name != "default" {
                        self.pantry.append(pantryFood)
                    }
                }
            }
        }
>>>>>>> Stashed changes
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
