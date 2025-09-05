//
//  AppeitizersApp.swift
//  Appeitizers
//
//  Created by Pavan on 01/09/25.
//

import SwiftUI

@main
struct AppeitizersApp: App {
    var orders = Order()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(orders)
        }
    }
}
