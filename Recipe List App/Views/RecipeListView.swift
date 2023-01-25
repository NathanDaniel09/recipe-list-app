//
//  ContentView.swift
//  Recipe List App
//
//  Created by Nathan Daniel on 23/1/2023.
//

import SwiftUI

struct RecipeListView: View {
    
    // reference to the viewmodel
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) {r in
                NavigationLink(destination: RecipeDetailView(recipe:r)) {
                    HStack(spacing: 15) {
                        Image(r.image).resizable().scaledToFill().frame(width:50,height: 50,alignment: .center).clipped().cornerRadius(7)
                        Text(r.name)
                }
                
                }
            }.navigationBarTitle("Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
