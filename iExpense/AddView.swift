//
//  AddView.swift
//  iExpense
//
//  Created by Yash Poojary on 29/09/21.
//

import SwiftUI


struct AddView: View {
    @Environment (\.presentationMode) var presentationMode
    
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    static let types = ["Personal", "Business"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type of Expense", selection: $type) {
                    ForEach(AddView.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add Expense")
            .navigationBarItems(leading:
                                    Button("Save") {
                if let actualAmount = Int(amount) {
                    let item = ExpenseItem(name: name, type: type, amount: actualAmount)
                    expenses.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            }
                                    
            
            )
        }
    }
}




struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}























//struct AddView: View {
//    @ObservedObject var expenses: Expenses
//    @State private var name = ""
//    @State private var type = "Personal"
//    @State private var amount = ""
//    static let types = ["Personal", "Business"]
//
//    var body: some View {
//        NavigationView {
//            Form {
//                TextField("Name", text: $name)
//                Picker("Type" , selection: $type) {
//                    ForEach(AddView.types, id: \.self) {
//                        Text($0)
//                    }
//                }
//                TextField("Amount", text: $amount)
//                    .keyboardType(.decimalPad)
//            }
//            .navigationTitle("Add Expense")
//        }
//    }
//}
