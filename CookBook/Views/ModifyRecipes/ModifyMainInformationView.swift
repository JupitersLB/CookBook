//
//  ModifyMainInformationView.swift
//  CookBook
//
//  Created by Liam Baker on 2022/01/04.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @Binding var mainInformation: MainInformation
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
            }
            Menu {
                Picker("Category", selection: $mainInformation.category) {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        Text(category.rawValue)
                    }
                }
                .pickerStyle(InlinePickerStyle())
            } label: {
                HStack {
                    Text("Category")
                    Spacer()
                    Text(mainInformation.category.rawValue)
                }
            }
            .listRowBackground(listBackgroundColor)
        }
        .foregroundColor(listTextColor)
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name",
                                                        description: "Test Description",
                                                        author: "Test Author",
                                                        category: .breakfast)
    @State static var emptyInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)
        
    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInformation)
        ModifyMainInformationView(mainInformation: $emptyInformation)
    }
}
