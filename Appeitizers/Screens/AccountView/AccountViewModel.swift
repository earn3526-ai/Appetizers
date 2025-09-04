//
//  AccountViewModel.swift
//  Appeitizers
//
//  Created by Pavan on 04/09/25.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthDate = Date()
    @Published var extraNapkin: Bool = false
    @Published var frequentRefills: Bool = false
    @Published var alertItem: AlertItem?
    
    func validate() -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContent.invalidForm
            return true
        }
        
        guard email.isValidEmail else {
            print("Error Email")
            alertItem = AlertContent.invalidEmail
            return true
        }
        return false
    }
}

