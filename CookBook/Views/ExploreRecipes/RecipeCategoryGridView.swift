//
//  RecipeCategoryGridView.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/04.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @StateObject private var recipeData = RecipeData()
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(
                        MainInformation.Category.allCases,
                        id: \.self
                    ) { category in
                        NavigationLink(
                            destination: RecipesListView(category: category)
                                .environmentObject(recipeData),
                            label: {
                                CategoryView(category: category)
                        })
                    }
                })
            }
            .navigationTitle("Categories")
            
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
