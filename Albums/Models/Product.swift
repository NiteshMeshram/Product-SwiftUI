//
//  Product.swift
//  Albums
//
//  Created by NiteshMeshram on 06/06/25.
//

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let slug: String
    let price: Int
    let description: String
    let category : Category
    let images: [String]
}
