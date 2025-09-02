//
//  AppeitizerListCell.swift
//  Appeitizers
//
//  Created by Pavan on 02/09/25.
//

import SwiftUI

struct AppeitizerListCell: View {
    var appietizer: Appeitizer
    var body: some View {
        HStack{
            Image("samplePizza")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 90)
                .cornerRadius(5)
          
            VStack(alignment: .leading, spacing: 5){
                Text(appietizer.name)
                Text("$\(appietizer.userId)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color.gray)
                    
                        
            }.padding()
                
        }
    }
}

#Preview {
    AppeitizerListCell(appietizer: MockData.sampleAppetizer)
}
