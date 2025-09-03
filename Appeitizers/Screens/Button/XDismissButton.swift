//
//  XDismissButton.swift
//  Appeitizers
//
//  Created by Pavan on 03/09/25.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.medium)
                .foregroundStyle(Color.black)
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    XDismissButton()
}
