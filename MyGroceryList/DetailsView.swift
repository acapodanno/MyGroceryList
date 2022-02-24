//
//  DetailsView.swift
//  MyGroceryList
//
//  Created by Alessandro Capodanno on 08/02/22.
//

import SwiftUI
struct DetailsView: View {
    var grocery:Grocery;
    @State var name: String = ""
    @State var desc: String = ""
    @State var quantity: Int = 0
    @EnvironmentObject var itemStore:ItemStore
    init(grocery:Grocery){
        self.grocery = grocery
        
        self._name = State(wrappedValue:grocery.title)
        self._desc = State(wrappedValue:grocery.description)
        self._quantity = State(wrappedValue:grocery.quantity)
    }
    var body: some View {
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
            Section(header: Text("Date Created")) {
                Text("\(grocery.created)")
            }
        }.navigationBarTitle("Edit Item").navigationBarItems(trailing: Button(action: {
            //itemStore.listGrocery.filter(<#T##isIncluded: (Grocery) throws -> Bool##(Grocery) throws -> Bool#>)
          // let test = itemStore.listGrocery.filter({g in return g.id != grocery.id})
          //  print(test)
            itemStore.updateItem(title: name, desc: desc, quantity: quantity,index:itemStore.getItemIndex(idGrocery: grocery.id)!)
            
        }){
                Text("Save")
            })
    }
   
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(grocery:Grocery(title:"",description:"", quantity: 0))
    }
}
