//
//  ContentView.swift
//  Appeitizers
//
//  Created by Pavan on 01/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var orders: Order
    var body: some View {
        TabView{
            AppeitzerView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }.badge(orders.items.count)
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }.tint(.pink)
        
                    
        
    
    }
}

#Preview {
    ContentView()
}
