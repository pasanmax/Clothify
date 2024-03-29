//
//  ProductView.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-19.
//

import SwiftUI

struct ProductView: View {
    
    @State var product: Product?
//    var image: String = "sale_product_view"
//    var title: String = "Product Name"
//    var subTitle: String = "Title"
//    var price: Int = 0
    var didTap: (()->())?
    
    var body: some View {
        NavigationLink {
            ProductDetailView(productDetailVM: ProductDetailViewModel(selectedProduct: product))
        } label: {
            VStack {
                Image(product?.img ?? "sale_product_view")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 148, height: 184)
                    .cornerRadius(10)
                
                Spacer()
                
                Text(product?.subtitle ?? "sub_title")
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundColor(.gray)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                
                Text(product?.title ?? "title")
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.priText)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                
                Text("LKR" + String(product?.price ?? 0))
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(.pri)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button {
                    didTap?()
                } label: {
                    
                }
            }
            .padding(0)
            .frame(width: 150, height: 260)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                    //.shadow(radius: 20)
                    
            )
        }
        
    }
}

#Preview {
    ProductView()
}
