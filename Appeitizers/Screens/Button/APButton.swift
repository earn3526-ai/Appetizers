//
//  APButton.swift
//  Appeitizers
//
//  Created by Pavan on 03/09/25.
//

import SwiftUI

struct APButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold,design: .rounded))
            .foregroundStyle(Color.white)
            .padding(.leading)
            .padding(.trailing)
            .frame( height: 45)
            .background(Color.pink)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Test Title")
}
