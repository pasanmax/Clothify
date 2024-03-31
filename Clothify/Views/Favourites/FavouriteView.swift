//
//  FavouriteView.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-31.
//

import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("search2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }
                Spacer()
                
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 30)
            
            
            
            ScrollView {
                VStack{
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Favourites")
                                .font(.customfont(.bold, fontSize: 34))
                                .padding(.leading, 20)
                        }
                        Spacer()
                    }
                }
                .padding(.top, 150)
                
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    FavouriteView()
        .environmentObject(CartManager())
}
