//
//  AppeitzerView.swift
//  Appeitizers
//
//  Created by Pavan on 01/09/25.
//

import SwiftUI

struct AppeitzerView: View {
    @ObservedObject var viewModel = AppeitizersViewModel()
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.appeitizersList) {appietizer in
                    AppeitizerListCell(appietizer: appietizer)
                }.navigationTitle("Appeitizers")
                
            }.onAppear{
                viewModel.getAppeitizers()
            }.alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            if viewModel.isLoading{
                ProgressView()
                    .scaleEffect(1.5)
                    .foregroundStyle(Color.pink)
            }
        }
    }
    
}

#Preview {
    AppeitzerView()
}
