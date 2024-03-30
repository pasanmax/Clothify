//
//  ShopViewModel.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-30.
//

import Foundation
import SwiftUI
import Combine

class ShopViewModel: ObservableObject {
    
    static var shared: ShopViewModel = ShopViewModel()
    
    var combine = Set<AnyCancellable>()
    
    @Published var shopProducts: [Product] = []
    
    init() {
        getAllProducts()
    }
    
    func getAllProducts() {
        
        let urlString = Globals.BASE_URL + "products"
        
        guard let url = URL(string: urlString) else { return }
                
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .retry(3)
            .decode(type: [Product].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { products in
                    self.shopProducts = products
                  })
            .store(in: &combine)
    }
    
    func getCategorizedProducts(category: String = "") {
        
        if (category == "") {
            let urlString = Globals.BASE_URL + "products?new=true"
            
            guard let url = URL(string: urlString) else { return }
                    
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .retry(3)
                .decode(type: [Product].self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { _ in },
                      receiveValue: { products in
                        self.shopProducts = products
                      })
                .store(in: &combine)
        } else {
            let urlString = Globals.BASE_URL + "products?category=" + category
            
            guard let url = URL(string: urlString) else { return }
                    
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .retry(3)
                .decode(type: [Product].self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { _ in },
                      receiveValue: { products in
                        self.shopProducts = products
                      })
                .store(in: &combine)
        }
    }
}
