//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Jaival Patel on 2022-08-14.
//

import SwiftUI
 
struct ModifyMainInformationView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
  @Binding var mainInformation: MainInformation
 
  var body: some View {
    Form {
      TextField("Recipe Name", text: $mainInformation.name)
      TextField("Author", text: $mainInformation.author)
      Section(header: Text("Description")) {
        TextEditor(text: $mainInformation.description)
      }
      Picker(selection: $mainInformation.category, label:
              HStack {
                Text("Category")
                Spacer()
                Text(mainInformation.category.rawValue)
              }) {
        ForEach(MainInformation.Category.allCases,
                id: \.self) { category in
          Text(category.rawValue)
        }
              }
      .pickerStyle(MenuPickerStyle())
      .listRowBackground(listBackgroundColor)
      
    }
    .foregroundColor(listTextColor)
  }
}
