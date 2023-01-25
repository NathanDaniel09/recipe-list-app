//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Nathan Daniel on 23/1/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                Image(recipe.image).resizable().scaledToFill().frame(width:400,height:300).clipped()
                
                // MARK: Divider
                Divider()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.top, 10).padding([.bottom, .top],5)
                    ForEach(recipe.ingredients, id: \.self) {ingredient in
                        Text( ingredient).padding(.bottom,1)
                    }
                }.padding(.horizontal,15)
                
                // MARK: Divider
                Divider()
                
                // MARK: Timings
                VStack(alignment: .leading) {
                    Text("Timings").font(.headline).padding([.bottom, .top],5)
                    Text("Preparation: " + recipe.prepTime).padding(.bottom,1)
                    Text("Cooking: " + recipe.cookTime)
                }.padding(.horizontal,15)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline).padding([.bottom, .top],5)
                    ForEach(0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom,1)
                        
                    }
                }.padding(.horizontal,15)
            }
            
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
