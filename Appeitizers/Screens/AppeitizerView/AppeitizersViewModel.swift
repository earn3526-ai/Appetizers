//
//  AppeitizersViewModel.swift
//  Appeitizers
//
//  Created by Pavan on 02/09/25.
//

import Foundation


final class AppeitizersViewModel: ObservableObject{
    @Published var appeitizersList: [Appeitizer] = []
    @Published var selectedAppeitizer: Appeitizer?
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isDetailPageShown: Bool = false
    
    func getAppeitizers(){
        isLoading = true
        NetworkManager.shared.getAppietizers { (result) in
            DispatchQueue.main.async{
                self.isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appeitizersList = appetizers
                    
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        self.alertItem = AlertContent.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContent.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContent.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContent.unableToComplete
                    }
                }
                
            }
        }
    }
    
}
