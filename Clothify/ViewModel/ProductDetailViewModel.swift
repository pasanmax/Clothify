//
//  ProductDetailViewModel.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-29.
//

import Foundation
import SwiftUI
import Combine

class ProductDetailViewModel : ObservableObject {
    
    static var shared: ProductDetailViewModel = ProductDetailViewModel()
    
    var combine = Set<AnyCancellable>()
    
    @Published var selectedProduct: Product?
    
    init(selectedProduct: Product? = nil) {
        self.selectedProduct = selectedProduct
    }
}
