//
//  DetailsCardView.swift
//  Appeitizers
//
//  Created by Pavan on 03/09/25.
//

import SwiftUI
import Kingfisher

struct DetailsCardView: View {
    
    var appitizerData: Appeitizer
    @Binding var toShow: Bool
    
    var body: some View {
        ZStack {
            VStack{
                ZStack {
                    KFImage.url(URL(string: appitizerData.image))
                        .resizable()
                        .placeholder({
                            Image("food-placeholder")
                                .resizable()
                        })
                    
                        .frame(width: 320, height: 250)
                        .aspectRatio(contentMode: .fill)
                        .overlay (Button{
                        }label: {
                            XDismissButton()
                                .onTapGesture {
                                    toShow = false
                                }
                            
                        }.padding(8),
                                  alignment: .topTrailing
                        )
                }
                
                
                
                
                VStack(spacing: 20){
                    Text(appitizerData.name)
                        .font(.system(size: 25, weight: .semibold,design: .rounded))
                    Text("This is our description of the product, its a tasty pizza ")
                        .multilineTextAlignment(.center)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    HStack(spacing: 50) {
                        NutritionInfo(title: "Calories", data: "\(appitizerData.caloriesPerServing)")
                        
                        NutritionInfo(title: "Carbs", data: "\(appitizerData.cookTimeMinutes)")
                        
                        NutritionInfo(title: "Protein", data: "\(appitizerData.prepTimeMinutes)")
                        
                    }
                    
                    Button{
                        
                    }label: {
                        APButton(title: "$\(appitizerData.userId) - Add To Order")
                    }.padding(.bottom)
                    
                    
                }
            }.frame(width: 320)
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(radius: 40)
            
            
        }
    }
}


#Preview {
    DetailsCardView(appitizerData: MockData.sampleAppetizer, toShow: .constant(false))
}
struct NutritionInfo: View{
    var title: String
    var data: String
    var body: some View{
        VStack(spacing: 10){
            Text(title)
                .font(.system(size: 15, weight: .semibold,design: .rounded))
            
            Text(data)
                .font(.system(size: 15, weight: .regular,design: .rounded))
        }

    }
}
