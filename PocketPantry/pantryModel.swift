//
//  pantryModel.swift
//  PocketPantry
//
//  Created by Anika Hamby on 10/22/22.
//

import Foundation

struct food: Identifiable, Codable {
    var id: Int
    var date_added: String
    var name: String
    var brand: String
    var category: String
}

struct pantry: Identifiable, Codable {
    var id: Int
    var foods: [food]
    var isShared: Bool
    var userID: Int
}


