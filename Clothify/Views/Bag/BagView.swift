//
//  BagView.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-31.
//

import SwiftUI

struct BagView: View {
    
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
                            Text("My Bag")
                                .font(.customfont(.bold, fontSize: 34))
                                .padding(.leading, 20)
                        }
                        Spacer()
                    }
                    
                    ForEach(cartManager.products, id: \.id) {
                        product in
                        
                        CartProduct(product: product, price: product.price)
                            .environmentObject(cartManager)
                    }
                    
                    if (cartManager.products.count > 0) {
                        HStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Total amount: ")
                                        .font(.customfont(.medium, fontSize: 14))
                                        .foregroundColor(.gray)
                                        .padding(.leading, 20)
                                }
                                Text("LKR " + "\(cartManager.total)")
                                    .font(.customfont(.medium, fontSize: 14))
                                    .padding(.leading, 10)
                            }
                            Spacer()
                        }
                        
                        HStack {
                            RoundButton(title: "CHECK OUT", didTap: {
                                
                            })
                            .padding()
                        }
                        .frame(width: .screenWidth)
                    } else {
                        HStack {
                            Text("Your bag is empty")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 50)
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
    BagView()
        .environmentObject(CartManager())
}
