//
//  RecipesModel.swift
//  Recipe List App
//
//  Created by Nathan Daniel on 23/1/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    // list of recipe objects
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
}
