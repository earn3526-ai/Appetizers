//
//  AppeitizerListCell.swift
//  Appeitizers
//
//  Created by Pavan on 02/09/25.
//

import SwiftUI
import Kingfisher

struct AppeitizerListCell: View {
    var appietizer: Appeitizer
    var body: some View {
        HStack{
            KFImage.url(URL(string: appietizer.image))
                .resizable()
                .placeholder({
                    Image("food-placeholder")
                        .resizable()
                })
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
