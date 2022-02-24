//
//  MyGroceryListApp.swift
//  MyGroceryList
//
//  Created by Alessandro Capodanno on 08/02/22.
//

import SwiftUI

@main
struct MyGroceryListApp: App {
    //@ObservedObject var itemStore: ItemStore
    var body: some Scene {
        WindowGroup {
            ContentView(itemStore:ItemStore())
        }
    }
}
