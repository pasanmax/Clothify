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
    
    @State private var filterOptions = ["All", "Women", "Men", "Tshirt", "Blouse"]
    
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
            
            
            
//            VStack {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    LazyHStack {
//                        ForEach(filterOptions, id: \.self) {
//                            option in
//                            Button {
//                                
//                            } label: {
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 29)
//                                        .stroke(.black)
//                                        .frame(width: 100, height: 30)
//                                        .foregroundColor(.white)
//                                        .padding(.leading, 10)
//                                    HStack {
//                                        Text(option)
//                                            .foregroundColor(.black)
//                                    }
//                                }
//                                
//                            }
//                        }
//                    }
//                }
//                Spacer()
//            }
//            .padding(.top, 100)
            
//            HStack {
//                Text("Filters")
//                    .foregroundColor(.black)
//                    .font(.customfont(.regular, fontSize: 11))
//            }
            
            ScrollView {
                
                
                
                HStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach (filterOptions, id: \.self) {
                                option in
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 29)
                                        //.stroke(.black, lineWidth: 1)
                                        .frame(width: 100, height: 30)
                                        .foregroundColor(.black)
                                    
                                    Button {
                                        if (option == "All") {
                                            shopVM.getAllProducts()
                                        } else {
                                            shopVM.shopProducts = shopVM.shopProducts.filter { $0.categories.contains(option) }
                                        }
                                        
                                    } label: {
                                        Text(option)
                                            .font(.customfont(.medium, fontSize: 14))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                    }
                                }
                                
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 100)
                
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
                .padding(.top, 20)
                
                
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
