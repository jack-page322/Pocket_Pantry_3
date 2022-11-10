//
//  PocketPantryApp.swift
//  PocketPantry
//
//  Created by Jack Page on 10/18/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

@main
struct PocketPantryApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
