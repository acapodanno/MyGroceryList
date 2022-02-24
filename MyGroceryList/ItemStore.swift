//
//  GroceryMangement.swift
//  MyGroceryList
//
//  Created by Alessandro Capodanno on 09/02/22.
//

import Foundation

class ItemStore: ObservableObject {
    @Published var listGrocery: [Grocery] = getList();
    func addItemList(){
        
    }
    func getItemIndex(idGrocery:UUID)->Int?{
        return listGrocery.firstIndex(where: {$0.id==idGrocery})
    }
    func updateItem(title:String,desc:String,quantity:Int,index:Int?){
        listGrocery[index!].title = title
        listGrocery[index!].description = desc
        listGrocery[index!].quantity = quantity
    }
}
