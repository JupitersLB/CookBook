//
//  ContentView.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/03.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(
                    recipe.mainInformation.name,
                    destination: RecipeDetailView(recipe: recipe)
                )
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
  var recipes: [Recipe] {
    recipeData.recipes
  }
 
  var navigationTitle: String {
    "All Recipes"
  }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
             RecipesListView()
        }
    }
}
