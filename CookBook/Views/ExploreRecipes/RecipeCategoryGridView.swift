//
//  RecipeCategoryGridView.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/04.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @EnvironmentObject private var recipeData: RecipeData
    
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
                            destination: RecipesListView(
                                viewStyle: .singleCategory(category)
                            ),
                            label: {
                                CategoryView(category: category)
                            }
                        )
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
