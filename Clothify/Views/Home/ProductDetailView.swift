//
//  ProductDetailView.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-29.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var productDetailVM: ProductDetailViewModel = ProductDetailViewModel(selectedProduct: nil)
    
    @State var selectedSizeOption = 0
    @State var selectedColorOption = 0
    
    let sizeOptions = ["S", "M", "L", "XL"]
    let colorOptions = ["Black", "Pink", "Yellow", "White"]
    
    //ar selectedProduct: Product?
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Text(productDetailVM.selectedProduct?.title ?? "Product title")
                        .font(.customfont(.bold, fontSize: 18))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("share")
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
                
                VStack {
                    HStack {
                        LazyHStack {
                            Image(productDetailVM.selectedProduct?.img ?? "sale_product_view")
                                .resizable()
                                .animation(.smooth)
                                .scaledToFit()
                                .frame(width: .screenWidth * 1.1, height: .screenWidth * 1.1)
                        }
                    }
                    
                   
                    HStack {
                        HStack {
                            
                            Text("Size")
                                .padding()
                                .font(.customfont(.regular, fontSize: 14))
                            
                            Picker("Select Size", selection: $selectedSizeOption) {
                                ForEach(0..<sizeOptions.count) { index in
                                    Text(self.sizeOptions[index])
                                        .tag(index)
                                        .font(.customfont(.regular, fontSize: 14))
                                }
                            }
                            .pickerStyle(DefaultPickerStyle())
                            //.padding(.top, 20)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                        .padding(.leading, 20)
                        //.padding(.trailing, 5)
                        
                        //Spacer(minLength: 10)
                        
                        HStack {
                            
                            Text("Color")
                                .padding()
                                .font(.customfont(.regular, fontSize: 14))
                            
                            Picker("Select Size", selection: $selectedColorOption) {
                                ForEach(0..<colorOptions.count) { index in
                                    Text(self.colorOptions[index])
                                        .tag(index)
                                        .font(.customfont(.regular, fontSize: 14))
                                }
                            }
                            .pickerStyle(DefaultPickerStyle())
                            //.padding(.top, 20)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        
                        Image("favourite")
                          .frame(width: 36, height: 36)
                          .foregroundColor(.white)
                          .background(Color.white)
                          .clipShape(Circle())
                          .shadow(radius: 5)
                          .padding(.trailing, 20)
                        
                    }
                    .frame(width: .screenWidth)
                    
                    HStack {
                        Text("Brand Name")
                            .font(.customfont(.bold, fontSize: 24))
                            .padding(.top, 10)
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        Text("LKR " + String(productDetailVM.selectedProduct?.price ?? 0))
                            .font(.customfont(.bold, fontSize: 24))
                            .padding(.top, 10)
                            .padding(.trailing, 20)
                    }
                    .frame(width: .screenWidth)
                    
                    HStack {
                        Text(productDetailVM.selectedProduct?.subtitle ?? "Small Text Line")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: .screenWidth)
                    
                    HStack {
                        Text(productDetailVM.selectedProduct?.desc ?? "Description")
                            .font(.customfont(.regular, fontSize: 14))
                            .padding(.top, 10)
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: .screenWidth)
                    
                    HStack {
                        RoundButton(title: "ADD TO CART") {
                            
                        }
                        .padding()
                    }
                    .frame(width: .screenWidth)
                }
            }
            .padding(.top, 100)
            
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ProductDetailView()
}
