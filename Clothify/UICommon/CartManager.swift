//
//  CartManager.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-30.
//

import Foundation

class CartManager: ObservableObject{
    
    @Published private(set) var products: [Product] = []
    
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product?) {
        products.append(product!)
        total += product!.price
    }
    
    func removeFromCart(product: Product?) {
        products = products.filter {
            $0.id != product!.id
        }
        total -= product!.price
    }
}
