//
//  AddView.swift
//  MyGroceryList
//
//  Created by Alessandro Capodanno on 08/02/22.
//

import SwiftUI

struct AddView: View {
    @State var name: String = ""
    @State var desc: String = ""
    @State var quantity: Int = 0
    @State var showAlert=false;
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var itemStore: ItemStore
    var body: some View {
        NavigationView{
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text:$name)
            }
            Section(header: Text("Description")) {
                TextField("Description", text:$desc)
            }
            Section(header: Text("Quantity")) {
                Stepper("\(quantity)", value: $quantity)
            }
        }
        .navigationTitle("Add item").navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }){
            Image(systemName: "chevron.left")
        },trailing: Button(action: {
            itemStore.listGrocery.append(Grocery(title: name, description: desc, quantity: quantity))
        }){
            Text("Save")
        })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(itemStore: ItemStore())
    }
}
