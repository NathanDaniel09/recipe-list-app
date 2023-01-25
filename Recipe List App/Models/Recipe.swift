//
//  Recipe.swift
//  Recipe List App
//
//  Created by Nathan Daniel on 23/1/2023.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
    
}
