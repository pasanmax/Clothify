//
//  CartProduct.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-31.
//

import SwiftUI

struct CartProduct: View {
    
    @State var quantity: Int = 1
    @EnvironmentObject var cartManager: CartManager
    var product: Product?
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 343, height: 110)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 6)
            
            HStack(spacing: 20) {
                Image(product?.img ?? "sale_product_view")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 104)
                    .cornerRadius(9)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(product?.title ?? "Product title")
                        .font(.customfont(.semibold, fontSize: 16))
                    
                    HStack {
                        Text("Color: ")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(.gray)
                        
                        Text(product?.color ?? "Color")
                            .font(.customfont(.regular, fontSize: 11))
                        
                        Text("Size: ")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(.gray)
                        
                        Text(product?.size ?? "L")
                            .font(.customfont(.regular, fontSize: 11))
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image("minus")
                          .frame(width: 36, height: 36)
                          .foregroundColor(.white)
                          .background(Color.white)
                          .clipShape(Circle())
                          .shadow(radius: 5)
                        
                        Text("\(self.quantity)")
                            .font(.customfont(.medium, fontSize: 11))
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        
                        Image("plus")
                          .frame(width: 36, height: 36)
                          .foregroundColor(.white)
                          .background(Color.white)
                          .clipShape(Circle())
                          .shadow(radius: 5)
                        
                        
                        Text("LKR" + "\(product?.price ?? 0)")
                            .font(.customfont(.medium, fontSize: 11))
                            .padding(.leading, 50)
                    }
                    .padding(.bottom, 3)
                    
                }
            }
            .frame(width: 343, height: 104)
        }
    }
}

#Preview {
    CartProduct()
        .padding()
}
