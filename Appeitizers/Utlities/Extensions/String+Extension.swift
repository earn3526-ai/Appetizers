//
//  String+Extension.swift
//  Appeitizers
//
//  Created by Pavan on 04/09/25.
//

import Foundation

extension String{
    
    var isValidEmail: Bool {
        let emailRegEx = "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
}
