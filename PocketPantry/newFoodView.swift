//
//  newFoodView.swift
//  PocketPantry
//
//  Created by Anika Hamby on 10/26/22.
//

import SwiftUI

struct newFoodView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newFood = ""
    @State private var newFoodCategory = ""
    @State private var newFoodBrand = ""
    
    var body: some View {
        VStack{
            TextField("Food", text: $newFood)
            TextField("Category", text: $newFoodCategory)
            TextField("Brand", text: $newFoodBrand)
            
            Button {
                dataManager.addFood(name: newFood, category: newFoodCategory, brand: newFoodBrand)
            } label: {
                Text("Add")
            }
        }
        .padding()
    }
}

struct newFoodView_Previews: PreviewProvider {
    static var previews: some View {
        newFoodView()
    }
}
