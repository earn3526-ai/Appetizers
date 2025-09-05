//
//  UserModel.swift
//  Appeitizers
//
//  Created by Pavan on 04/09/25.
//

import Foundation

struct User: Codable{
     var firstName = ""
     var lastName = ""
     var email = ""
     var birthDate = Date()
     var extraNapkin = false
     var frequentRefills = false
    
}
