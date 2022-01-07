//
//  ModifyDirectionView.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/05.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView {
    @Binding var direction: Direction
    @Environment(\.presentationMode) private var mode
    
    let createAction: (Direction) -> Void
    
    init(component: Binding<Direction>, createAction: @escaping (Direction) -> Void) {
        self._direction = component
        self.createAction = createAction
    }
     
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
     
     
    var body: some View {
        Form {
            TextField("Direction Description", text: $direction.description)
                .listRowBackground(listBackgroundColor)
            Toggle("Optional", isOn: $direction.isOptional)
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save") {
                    createAction(direction)
                    mode.wrappedValue.dismiss()
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        }
        .foregroundColor(listTextColor)
    }
}

struct ModifyDirectionView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    
    static var previews: some View {
        NavigationView {
            ModifyDirectionView(component: $recipe.directions[0]) { direction in
                print(direction)
            }
        }
    }
}
