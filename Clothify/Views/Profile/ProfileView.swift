//
//  ProfileVIew.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-31.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var cartManager: CartManager
    
    @State var isLoggedIn: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    
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
                
                if (self.isLoggedIn) {
                    VStack{
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("My Profile")
                                    .font(.customfont(.bold, fontSize: 34))
                                    .padding(.leading, 20)
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Image("profileImage")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(30)
                            
                            VStack {
                                HStack {
                                    Text("User Name")
                                        .font(.customfont(.semibold, fontSize: 18))
                                    Spacer()
                                }
                                HStack {
                                    Text("user@email.com")
                                        .font(.customfont(.semibold, fontSize: 18))
                                        //.foregroundColor(.gray)
                                        .accentColor(.gray)
                                    Spacer()
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        //Divider()
                        
                        
                        LazyVStack {
                            VStack {
                                HStack(spacing: 15) {
                                    Text("My Orders")
                                        .font(.customfont(.semibold, fontSize: 16))
                                    Spacer()
                                    Image("next")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                }
                                .padding()
                                
                                HStack(spacing: 15) {
                                    Text("Shipping addresses")
                                        .font(.customfont(.semibold, fontSize: 16))
                                    Spacer()
                                    Image("next")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                }
                                .padding()
                                
                                HStack(spacing: 15) {
                                    Text("Payment methods")
                                        .font(.customfont(.semibold, fontSize: 16))
                                    Spacer()
                                    Image("next")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                }
                                .padding()
                                
                                HStack(spacing: 15) {
                                    Text("Promocodes")
                                        .font(.customfont(.semibold, fontSize: 16))
                                    Spacer()
                                    Image("next")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                }
                                .padding()
                                
                                HStack(spacing: 15) {
                                    Text("My Reviews")
                                        .font(.customfont(.semibold, fontSize: 16))
                                    Spacer()
                                    Image("next")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                }
                                .padding()
                                
                                HStack(spacing: 15) {
                                    Text("Settings")
                                        .font(.customfont(.semibold, fontSize: 16))
                                    Spacer()
                                    Image("next")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                }
                                .padding()
                                
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            self.isLoggedIn = false
                        } label: {
                            Text("Log Out")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(Color.pri)
                                .multilineTextAlignment(.center)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                        .background(Color(hex: "F2F3F2"))
                        .cornerRadius(25)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                    }
                    .padding(.top, 150)
                } else {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Login")
                                    .font(.customfont(.bold, fontSize: 34))
                                    .padding(.leading, 20)
                            }
                            Spacer()
                        }
                        .padding(.bottom, 50)
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 343, height: 64)
                                    .foregroundColor(.white)
                                    .shadow(radius: 2)
                                TextField("Email", text: $email) {
                                    
                                }
                                .padding(.leading, 50)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 343, height: 64)
                                    .foregroundColor(.white)
                                    .shadow(radius: 2)
                                TextField("Password", text: $password) {
                                    
                                }
                                .padding(.leading, 50)
                            }
                            
                        }
                        HStack {
                            Spacer()
                            Text("Forgot your password?")
                                .font(.customfont(.medium, fontSize: 14))
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.trailing, 30)
                        .padding(.top, 5)
                        
                        HStack {
                            RoundButton(title: "LOGIN", didTap: {
                                self.isLoggedIn = true
                            })
                            .padding()
                        }
                        .frame(width: .screenWidth)
                    }
                    .padding(.top, 150)
                }
                
                
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ProfileView()
        .environmentObject(CartManager())
}
