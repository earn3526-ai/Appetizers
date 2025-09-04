//
//  AppeitzerView.swift
//  Appeitizers
//
//  Created by Pavan on 01/09/25.
//

import SwiftUI


struct AppeitzerView: View {
    @StateObject var viewModel = AppeitizersViewModel()
   
    
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.appeitizersList) {appietizer in
                    
                    AppeitizerListCell(appietizer: appietizer)
                    .onTapGesture {
                            viewModel.selectedAppeitizer = appietizer
                            viewModel.isDetailPageShown = true
                        }
                }.navigationTitle("Appeitizers")
                    .disabled(viewModel.isDetailPageShown)
            }.blur(radius: viewModel.isDetailPageShown ? 10 : 0)
                if viewModel.isDetailPageShown {
                    DetailsCardView(appitizerData: viewModel.selectedAppeitizer ?? MockData.sampleAppetizer, toShow: $viewModel.isDetailPageShown)
                }
            if viewModel.isLoading{
                ProgressView()
                    .scaleEffect(1.5)
                    .foregroundStyle(Color.pink)
            }
 
                
            }.onAppear{
                viewModel.getAppeitizers()
                
            }.alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            
       
        }
    }
    


#Preview {
    AppeitzerView()
}
