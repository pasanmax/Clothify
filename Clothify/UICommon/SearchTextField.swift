//
//  SearchTextField.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-13.
//

import SwiftUI

struct SearchTextField: View {
    @State var placeHolder: String = "Placeholder"
    @Binding var txt: String
    
    var body: some View {
        HStack(spacing: 15) {
            
            Image("search")
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
                .frame(width: 20, height: 20)
            
            TextField(placeHolder, text: $txt)
                .font(.customfont(.regular, fontSize: 17))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(height: 44)
        .padding(15)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(16)
    }
}

//#Preview {
//    @Binding var txt: String
//    SearchTextField(placeHolder: "Search Store", txt: $txt)
//        //.padding(15)
//}
