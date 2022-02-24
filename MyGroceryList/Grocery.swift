//
//  Grocery.swift
//  MyGroceryList
//
//  Created by Alessandro Capodanno on 09/02/22.
//

import Foundation

struct Grocery: Identifiable{
    var id = UUID()
    var title: String
    var description: String
    var quantity: Int
    var created:Date=Date.now
}

var listGroceriesItem = [
    Grocery(title: "Title1", description: "Description", quantity:2),
    Grocery(title: "Title", description: "Description", quantity:4),
    Grocery(title: "Title", description: "Description", quantity:2),
    Grocery(title: "Title", description: "Description", quantity:3)
]
func getList() -> Array<Grocery>{
    return listGroceriesItem
}
func addItemGrocery(title:String,description:String,quantity:Int) {
    listGroceriesItem.append(Grocery(title: title, description: description, quantity: quantity))
    print(listGroceriesItem)
}
func getItemById(idGrocery:UUID)->[Grocery] {
    return listGroceriesItem.filter({g in return idGrocery==g.id})
}
