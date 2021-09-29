//
//  ContentView.swift
//  iExpense
//
//  Created by Yash Poojary on 24/09/21.
//

//


import SwiftUI


struct ExpenseItem: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}


struct ContentView: View {
    @ObservedObject private var expenses = Expenses()
    @State private var isShowing = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeRows)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
            Button(action: {
                isShowing = true
            }) {
                Image(systemName: "plus")
            }
            )
            .sheet(isPresented: $isShowing) {
                AddView(expenses: expenses)
            }
        }
        
    }
    
    func removeRows(at offset: IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
}







//struct ContentView: View {
//
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//
//    var body: some View {
//
//        VStack {
//            Button("The tap count is \(tapCount)") {
//                tapCount += 1
//                UserDefaults.standard.set(tapCount, forKey: "Tap")
//            }
//        }
//
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List{
//                    ForEach(numbers, id: \.self) {
//                        Text("\($0)")
//                    }
//                    .onDelete(perform: removeRows)
//
//                    Button("Add number") {
//                        numbers.append(currentNumber)
//                        currentNumber += 1
//                    }
//                }
//            }
//            .navigationBarItems(leading: EditButton())
//        }
//    }
//
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}


//class name: ObservableObject {
//  @Published  var firstName = "Yash"
//  @Published  var lastName = "Poojary"
//}
//
//struct ContentView1: View {
//
//   @ObservedObject private var user = name()
//
//    var body: some View {
//        VStack {
//            Text("My name is \(user.firstName) \(user.lastName)")
//            TextField("FirstName", text: $user.firstName)
//            TextField("LastName" , text: $user.lastName)
//        }
//
//    }
//}

///struct SecondView: View {
//    var name: String
//    @Environment(\.presentationMode) var presentationMode
//
//
//    var body: some View {
//        VStack {
//            Text("Hello, \(name)!")
//            Button("Dismiss") {
//                presentationMode.wrappedValue.dismiss()
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//
//    @State private var isShowing = false
//
//
//    var body: some View {
//        Button("Show Sheet") {
//            isShowing.toggle()
//        }
//        .sheet(isPresented: $isShowing) {
//            SecondView(name: "Yash")
//        }
//
//    }
//}


//import SwiftUI
//
//struct ContentView: View {
//
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//
//    var body: some View {
//
//        Button("The tap count is \(tapCount)") {
//            tapCount += 2
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
//        }
//    }
//}




//struct User: Codable {
//        var firstName: String
//        var lastName: String
//}
//
//struct ContentView: View {
//
//    @State private var user = User(firstName: "Yash", lastName: "Poojary")
//
//    var body: some View {
//        Button("Save Me") {
//
//            let encoder = JSONEncoder()
//
//            if let data = try? encoder.encode(user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//
//        }
//
//    }
//}
