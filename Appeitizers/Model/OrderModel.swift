//
//  OrderModel.swift
//  Appeitizers
//
//  Created by Pavan on 05/09/25.
//

import Foundation

final class Order: ObservableObject{
    @Published var items: [Appeitizer] = []
    var totalPrice: Int{
        items.reduce(0) {$0 + $1.userId}
    }
    
    func add(_ appeitizer: Appeitizer){
        items.append(appeitizer)
    }
    
    func deleteItem(at offset: IndexSet){
        items.remove(atOffsets: offset)
    }
    
    
}
