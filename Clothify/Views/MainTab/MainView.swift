//
//  MainView.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-10.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        ZStack {
//            TabView(selection: $homeVM.selectedTab) {
//                HomeView().tag(0)
//                ShopView().tag(1)
//                NavigationBarView().tag(2)
//                NavigationBarView().tag(3)
//                NavigationBarView().tag(4)
//            }
//            .onAppear {
//                UIScrollView.appearance().isScrollEnabled = false
//            }
//            .tabViewStyle(.page(indexDisplayMode: .never))
//            .onChange(of: homeVM.selectedTab) { newValue in
//                debugPrint("selected Tab :  \(newValue)")
//            }
//            
            if(homeVM.selectedTab == 0) {
                HomeView()
                    .environmentObject(cartManager)
            }else if(homeVM.selectedTab == 1) {
                ShopView()
                    .environmentObject(cartManager)
            }else if(homeVM.selectedTab == 2) {
                BagView()
                    .environmentObject(cartManager)
            }else if(homeVM.selectedTab == 3) {
                //FavouriteView()
            }else if(homeVM.selectedTab == 4) {
                //ProfileView()
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    NavigationButton(title: "Home", icon: "home_tab", isSelect: homeVM.selectedTab == 0 ) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectedTab = 0
                            }
                        }
                    }
                    NavigationButton(title: "Shop", icon: "shop_tab", isSelect: homeVM.selectedTab == 1 ) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectedTab = 1
                            }
                        }
                    }
                    NavigationButton(title: "Bag", icon: "bag_tab", isSelect: homeVM.selectedTab == 2) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectedTab = 2
                            }
                        }
                    }
                    NavigationButton(title: "Favourites", icon: "favourite_tab", isSelect: homeVM.selectedTab == 3 ) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectedTab = 3
                            }
                        }
                    }
                    NavigationButton(title: "Profile", icon: "profile_tab", isSelect: homeVM.selectedTab == 4) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectedTab = 4
                            }
                        }
                    }
                    
                }
                .padding(.top, 10)
                .padding(.bottom, .bottomInsets)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        MainView()
    }
}
