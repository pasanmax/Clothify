//
//  ProductViewModel.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-26.
//

import Foundation
import SwiftUI
import Combine

class ProductViewModel : ObservableObject {
    
    static var shared: ProductViewModel = ProductViewModel()
    
    var combine = Set<AnyCancellable>()
    
    @Published var saleProducts : [Product] = []
    @Published var newProducts : [Product] = []
    @Published var product : Product?
    
    init() {
        //getAllProducts()
    }
    
    func getAllSaleProducts() {
        //print("Products printing...")
        
        //let urlString = "http://localhost:5000/api/products/find/66007001a478ae148f657098"
        let urlString = Globals.BASE_URL + "products?category=sale"
        
//        guard let url = URL(string: urlString) else { return }
//        
//        let request = URLRequest(url: url)
//        
//        let session = URLSession(configuration: .default)
//        
//        session.dataTaskPublisher(for: request)
//            .map(\.data)
//            .retry(3)
//            .decode(type: Product.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//            .receive(on: DispatchQueue.main)
//            .sink { res in
//            } receiveValue: { model in
//                
//                //print(model)
//                //guard let self.product = model else { return }
//                self.product = model
//                print(self.product)
//                //self.product = model
//            }
        
        guard let url = URL(string: urlString) else { return }
                
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .retry(3)
            .decode(type: [Product].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { products in
                    self.saleProducts = products
//                    for product in products {
//                        print(product)
//                    }
                  })
            .store(in: &combine)
    }
    
    func getAllNewProducts() {
        
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
                    self.newProducts = products
                  })
            .store(in: &combine)
    }
}
