//
//  AccountView.swift
//  Appeitizers
//
//  Created by Pavan on 01/09/25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @State var isInValid: Bool = false
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                    DatePicker("Birth Date", selection: $viewModel.birthDate, displayedComponents: .date)
                    Button{
                        isInValid = viewModel.validate()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header:Text("Requests")) {
                    Toggle("Extra Napkin", isOn: $viewModel.extraNapkin)
                    Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
                    
                }.toggleStyle(SwitchToggleStyle(tint: Color.pink))
                
                    
            }.navigationTitle("AccountView")
            
            
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
