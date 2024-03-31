//
//  NavigationButton.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-10.
//

import SwiftUI

struct NavigationButton: View {
    
    @State var title: String = "Title"
    @State var icon: String = "shop_tab"
    var isSelect: Bool = false
    var didSelect: (()->())
    
    var body: some View {
        Button {
            didSelect()
        } label: {
            VStack {
                Image(isSelect ? icon + "_active" : icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
                    .foregroundColor(isSelect ? .pri : .priText)
            }
        }
        .foregroundColor(.priText)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    NavigationButton {
        
    }
}
