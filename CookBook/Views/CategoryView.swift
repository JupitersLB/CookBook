//
//  CategoryView.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/04.
//

import SwiftUI

struct CategoryView: View {
    let category: MainInformation.Category
 
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.55)
            Text(category.rawValue)
                .font(.title.bold())
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: RecipeData().recipes[0].mainInformation.category)
    }
}
