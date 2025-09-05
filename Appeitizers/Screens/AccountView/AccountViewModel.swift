//
//  AccountViewModel.swift
//  Appeitizers
//
//  Created by Pavan on 04/09/25.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("users") var userData: Data?
    
    func validate() -> Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContent.invalidForm
            return true
        }
        
        guard user.email.isValidEmail else {
            print("Error Email")
            alertItem = AlertContent.invalidEmail
            return true
        }
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(user)
            userData = data
            alertItem = AlertContent.userSaveSuccess
        }catch{
            alertItem = AlertContent.invalidUserData
        }
        
        
        return false
    }
    
    func retriveUserData(){
        guard let userData = userData else {return}
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContent.invalidUserData
        }
    }
}

