//
//  ModifyIngredientView.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/04.
//

import SwiftUI

struct ModifyIngredientView: View {
    @Binding var ingredient: Ingredient
    @Environment(\.presentationMode) private var mode
    
    let createAction: ((Ingredient) -> Void)
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
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
                                  formatter: formatter
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

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var emptyIngredient = Ingredient()
    
    static var previews: some View {
        NavigationView {
            ModifyIngredientView(ingredient: $emptyIngredient) { ingredient in
                print(ingredient)
            }
        }
    }
}
