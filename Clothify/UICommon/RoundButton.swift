//
//  RoundButton.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-10.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.pri)
        .cornerRadius(25)
    }
}

#Preview {
    RoundButton()
        .padding(20)
}
