//
//  pantryModel.swift
//  PocketPantry
//
//  Created by Anika Hamby on 10/22/22.
//

import SwiftUI


struct Food: Identifiable, Codable {
    var id: String
    var name: String
    var brand: String
    var category: String
}
<<<<<<< Updated upstream
=======

struct PantryFood: Identifiable, Codable {
    var id: String
    var name: String
    var brand: String
    var dateAdded: String
    var category: String
    var expiration: String
    var icon: String
}
>>>>>>> Stashed changes
//struct FoodRef: Codable {
//    var id: String
//    var date_added: String
//}
//
//struct Pantry: Codable {
//    var id: String
//    var foods: [FoodRef]
//    var isShared: Bool
//    var userID: String
//}


