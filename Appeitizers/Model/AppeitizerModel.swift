//
//  AppeitizerModel.swift
//  Appeitizers
//
//  Created by Pavan on 01/09/25.
//

import SwiftUI

struct Appeitizer: Decodable, Identifiable{
    let id: Int
        let name: String
        let prepTimeMinutes, cookTimeMinutes: Int
        let caloriesPerServing: Int
        let userId: Int
        let image: String
}

struct AppeitzerResponse: Decodable{
    let recipes: [Appeitizer]
   
    
}

struct MockData{
    static let sampleAppetizer = Appeitizer(
        id: 1,
        name: "Margherita Pizza",
        prepTimeMinutes: 15,
        cookTimeMinutes: 15,
        caloriesPerServing: 280,
        userId: 101,
        image: "samplePizza")
    
    static let sampleAppetizer2 = Appeitizer(
        id: 2,
        name: "Margherita Pizza",
        prepTimeMinutes: 15,
        cookTimeMinutes: 15,
        caloriesPerServing: 280,
        userId: 101,
        image: "samplePizza")

    
    static let sampleAppetizer3 = Appeitizer(
        id: 3,
        name: "Margherita Pizza",
        prepTimeMinutes: 15,
        cookTimeMinutes: 15,
        caloriesPerServing: 280,
        userId: 101,
        image: "samplePizza")
    
    static let sampleAppetizer4 = Appeitizer(
        id: 4,
        name: "Margherita Pizza",
        prepTimeMinutes: 15,
        cookTimeMinutes: 15,
        caloriesPerServing: 280,
        userId: 101,
        image: "samplePizza")
    
    static let sampleAppetizer5 = Appeitizer(
        id: 5,
        name: "Margherita Pizza",
        prepTimeMinutes: 15,
        cookTimeMinutes: 15,
        caloriesPerServing: 280,
        userId: 101,
        image: "samplePizza")


    
    static let appitizers = [sampleAppetizer, sampleAppetizer2, sampleAppetizer3, sampleAppetizer4, sampleAppetizer5]
}
