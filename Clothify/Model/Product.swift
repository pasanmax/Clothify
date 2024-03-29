//
//  Product.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-26.
//

import Foundation

struct Product: Codable, Identifiable {
    var id, title, subtitle, desc: String
    let img: String
    let categories: [String]
    let size, color: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, subtitle, desc, img, categories, size, color, price
    }
}
