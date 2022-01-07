//
//  ModifyIngredientView.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/04.
//

import SwiftUI

struct ModifyIngredientView: ModifyComponentView {
    @Binding var ingredient: Ingredient
    @Environment(\.presentationMode) private var mode
    
    let createAction: ((Ingredient) -> Void)
    
    init(component: Binding<Ingredient>, createAction: @escaping (Ingredient) -> Void) {
        self._ingredient = component
        self.createAction = createAction
    }
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            Form {
                TextField("Ingredient Name", text: $ingredient.name)
                    .listRowBackground(listBackgroundColor)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack {
                        Text("Quantity:")
                        TextField("Quantity",
                                  value: $ingredient.quantity,
                                  formatter: NumberFormatter.decimal
                        )
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                .listRowBackground(listBackgroundColor)
                Menu {
                    Picker("Unit", selection: $ingredient.unit) {
                        ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                } label: {
                    HStack {
                        Text("Unit")
                        Spacer()
                        Text(ingredient.unit.rawValue)
                    }
                }
                .listRowBackground(listBackgroundColor)
                HStack {
                    Spacer()
                    Button("Save") {
                        createAction(ingredient)
                        mode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
                .listRowBackground(listBackgroundColor)
            }
        }
        .foregroundColor(listTextColor)
    }
}

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
           ModifyIngredientView(component: $recipe.ingredients[0]) { ingredient in
                print(ingredient)
            }.navigationTitle("Add Ingredient")
        }
    }
}
