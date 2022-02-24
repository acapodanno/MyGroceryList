//
//  ContentView.swift
//  MyGroceryList
//
//  Created by Alessandro Capodanno on 08/02/22.
//

import SwiftUI

struct GroceryItem: View{
    var grocery:Grocery
    var body: some View {
        HStack{
            VStack(alignment:.leading,spacing: 7.0){
                Text(grocery.title);
                Text(grocery.description).font(.subheadline).foregroundColor(.blue);
            };
            Spacer()
            Text("\(grocery.quantity)");            

            
        }.frame(height: 60)
    }
}
struct ContentView: View {
    @State var showingAdd = false
    @ObservedObject var itemStore: ItemStore

    
       var body: some View {
           NavigationView{
               List (itemStore.listGrocery){
                groceryItem in
                NavigationLink(destination:DetailsView(grocery:groceryItem)){
                GroceryItem(grocery:groceryItem)
                }.listRowSeparator(.hidden)
                
            }
            .navigationTitle("My Grocery List").navigationBarItems(trailing: Button(action:{
                showingAdd.toggle();
            }){
                Image(systemName: "plus")
            })
            
           }.sheet(isPresented: $showingAdd){
               AddView(itemStore: itemStore)
           }
           .environmentObject(itemStore)
           
   }
        

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
       
            ContentView(itemStore: ItemStore())
            
  
    }
}
