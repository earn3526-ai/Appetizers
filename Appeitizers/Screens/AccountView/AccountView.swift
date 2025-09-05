//
//  AccountView.swift
//  Appeitizers
//
//  Created by Pavan on 01/09/25.
//

import SwiftUI



struct AccountView: View {
    
    enum FocusTextField: Hashable{
        case firstName, lastName, email
    }
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState var focusTextField: FocusTextField?
    @State var isInValid: Bool = false
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusTextField, equals: .firstName)
                        .onSubmit { focusTextField = .lastName}
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusTextField, equals: .lastName)
                        .onSubmit { focusTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .focused($focusTextField, equals: .email)
                        .onSubmit { focusTextField = nil }
                        .submitLabel(.continue)
                    
                    DatePicker("Birth Date", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    Button{
                        isInValid = viewModel.validate()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header:Text("Requests")) {
                    Toggle("Extra Napkin", isOn: $viewModel.user.extraNapkin)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    
                }.toggleStyle(SwitchToggleStyle(tint: Color.pink))
                
                    
            }.navigationTitle("AccountView")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") {
                            focusTextField = nil
                        }
                    }
                }
            
            
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }.onAppear{
            viewModel.retriveUserData() 
        }
    }
}

#Preview {
    AccountView()
}
