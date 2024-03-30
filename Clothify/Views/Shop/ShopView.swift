//
//  ShopView.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-30.
//

import SwiftUI

struct ShopView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    @StateObject var shopVM = ShopViewModel.shared
    
    init() {
        self.shopVM.getAllProducts()
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
//                    Button {
//                        mode.wrappedValue.dismiss()
//                    } label: {
//                        Image("back")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 25, height: 25)
//                    }
                    
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
                HStack {
                    LazyVGrid(columns: column, spacing: 20) {
                        ForEach(shopVM.shopProducts, id: \.id) {
                            product in
                            
                            ProductView(product: product ) {
                                                                
                            }
                            .environmentObject(cartManager)
                        }
                    }
                }
                .padding(.top, 150)
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
//        .onAppear {
//            self.shopVM.getAllProducts()
//        }
    }
}

#Preview {
    NavigationView {
        ShopView()
            .environmentObject(CartManager())
    }
    
    //ShopView()
}
