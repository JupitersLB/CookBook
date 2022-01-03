//
//  RecipeData.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/03.
//

import Foundation

class RecipeData: ObservableObject {
  @Published var recipes = Recipe.testRecipes
}
