//
//  DataService.swift
//  Recipe List App
//
//  Created by Nathan Daniel on 23/1/2023.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local JSON file
        
        // Get a URL path to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a URL object
        let url = URL(filePath: pathString!)
        
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add unique IDs to each recipe
                for recipe in recipeData {
                    recipe.id = UUID()
                    // Add unique IDs to each ingredient
                    for i in recipe.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
                
            }
            catch {
                print("Error: Couldn't decode JSON file")
            }
        }
        catch {
            // Error with getting data
            print("Error: Couldn't get data")
        }
        
        return [Recipe]()
        
    }
}
