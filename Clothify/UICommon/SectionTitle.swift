//
//  SectionTitle.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-17.
//

import SwiftUI

struct SectionTitle: View {
    
    @State var title: String = "Title"
    @State var subTitle: String = "Sub Title"
    @State var titleAll: String = "View All"
    var didTap: (()->())?
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.customfont(.bold, fontSize: 24))
                    .foregroundColor(.priText)
                
                Spacer()
                
                Text(titleAll)
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.priText)
                    .onTapGesture {
                        didTap?()
                    }
            }
            HStack {
                Text(subTitle)
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
        }
        .frame(height: 40)
    }
}

#Preview {
    SectionTitle()
        .padding(20)
}
