//
//  OrderView.swift
//  Appeitizers
//
//  Created by Pavan on 01/09/25.
//

import SwiftUI

struct OrderView: View {
   
    @EnvironmentObject var orders: Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List {
                        ForEach(orders.items) { appiteizer in
                            AppeitizerListCell(appietizer: appiteizer)
                        }
                        .onDelete(perform: orders.deleteItem)
                    }.listStyle(.plain)
                    Spacer()
                    Button{
                        
                    }label: {
                        APButton(title: "$\(orders.totalPrice) - Place Order")
                    }.padding()
                }.navigationTitle("Orders")
                
                if orders.items.isEmpty{
                    OrderEmptyState()   
                }
                
            }
        }
        
       
    }
    
}

#Preview {
    OrderView()
}
