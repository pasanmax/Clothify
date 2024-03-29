//
//  HomeView.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-09.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    @StateObject var productVM = ProductViewModel.shared
    
    var body: some View {
        
        ZStack {
            ScrollView {
//                VStack {
//                    Text("Clothify")
//                        .font(.customfont(.bold, fontSize: 20))
//                        .padding(.bottom, .screenWidth * 0.1)
//                    
//                    HStack {
//                        Image("location")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 16, height: 16)
//                            //.padding(.bottom, .screenWidth * 0.1)
//                        
//                        Text("Colombo, Sri Lanka")
//                            .font(.customfont(.semibold, fontSize: 18))
//                    }
//                    
//                    SearchTextField(placeHolder: "Search Store", txt: $homeVM.searchText)
//                        .padding(20)
//                }
//                .padding(.top, .topInsets)
                
                Image("banner")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Text("Street Clothes")
                            .font(.customfont(.bold, fontSize: 40))
                            .foregroundColor(.white)
                            .padding(20)
                        , alignment: .bottomLeading)
                    .ignoresSafeArea()
                
                Spacer(minLength: 20)
                
                SectionTitle(title: "Sale", subTitle: "Super Summer Sale", titleAll: "View All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
//                        List (productVM.products, id: \.id) {
//                            product in
//                            ProductView(image: "sale_product_view") {
//                                
//                            }
//                            //Text(product.title)
//                        }
                        ForEach (productVM.saleProducts, id: \.id) {
                            product in
                            
                            ProductView(product: product ) {
                                                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                    .onAppear {
                        productVM.getAllSaleProducts()
                    }
                }
                
                Spacer(minLength: 20)
                
                SectionTitle(title: "New", subTitle: "You've never seen it before", titleAll: "View All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (productVM.newProducts, id: \.id) {
                            product in
                            
                            ProductView(product: product ) {
                                                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                    .onAppear {
                        productVM.getAllNewProducts()
                    }
                }
                
                Spacer(minLength: 20)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
