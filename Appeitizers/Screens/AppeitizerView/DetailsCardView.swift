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
                            
                            ZStack {
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color.white)
                                    .opacity(0.6)
                                Image(systemName: "xmark")
                                    .imageScale(.medium)
                                    .foregroundStyle(Color.black)
                                    .frame(width: 40, height: 40)
                                    .onTapGesture {
                                        toShow = false
                                    }
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
                        VStack(spacing: 10){
                            Text("Calories")
                            
                                .font(.system(size: 15, weight: .semibold,design: .rounded))
                            
                            Text("\(appitizerData.caloriesPerServing)")
                                .font(.system(size: 15, weight: .regular,design: .rounded))
                        }
                        VStack(spacing: 10){
                            Text("Carbs")
                                .font(.system(size: 15, weight: .semibold,design: .rounded))
                            Text("\(appitizerData.cookTimeMinutes) g")
                                .font(.system(size: 15, weight: .regular,design: .rounded))
                        }
                        VStack(spacing: 10){
                            Text("Protin")
                                .font(.system(size: 15, weight: .semibold,design: .rounded))
                            Text("\(appitizerData.prepTimeMinutes) g")
                                .font(.system(size: 15, weight: .regular,design: .rounded))
                        }
                        
                    }
                    
                    Button{
                        
                    }label: {
                        Text("$\(appitizerData.userId) - Add To Order")
                            .font(.system(size: 22, weight: .bold,design: .rounded))
                            .foregroundStyle(Color.white)
                            .padding(.leading)
                            .padding(.trailing)
                            .frame( height: 55)
                            .background(Color.pink)
                            .cornerRadius(10)
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
