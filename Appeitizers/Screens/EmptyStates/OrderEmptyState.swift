//
//  OrderEmptyState.swift
//  Appeitizers
//
//  Created by Pavan on 05/09/25.
//

import SwiftUI

struct OrderEmptyState: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10){
                Image("EmptyState")
                    .resizable()
                    .frame(width: 220, height: 220)
                Text("Your Cart Is Empty")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
            }.offset(y: -50.0)
        }
    }
}

#Preview {
    OrderEmptyState()
}
