//
//  Product.swift
//  Rumii App
//
//  Created by Jason Hennig on 7/24/23.
//

import Foundation

struct Product: Identifiable, Codable, Hashable, Equatable {
    var id = UUID()
    var name: String
    var pop: String
    var rating: Double
    var reviews: Int
    var image: String
    var price: Int
}

var productList = [
    Product(name: "Night Shift", pop: "Neutral", rating: (4.5), reviews: 51, image: "Rumiis_Night", price: 32),
    Product(name: "Night Shift", pop: "Pop", rating: (4.2), reviews: 51, image: "Rumiis_Nightp", price: 32),
    Product(name: "The Frontliner", pop: "Neutral", rating: (4.0), reviews: 51, image: "Rumiis_Frontliner", price: 32),
    Product(name: "The Frontliner", pop: "Pop", rating: (4.7), reviews: 51, image: "Rumiis_Frontlinerp", price: 32),
    Product(name: "Full Moon", pop: "Neutral", rating: (4.0), reviews: 51, image: "Rumiis_Moon", price: 32),
    Product(name: "Full Moon", pop: "Pop", rating: (5.0), reviews: 51, image: "Rumiis_Moonp", price: 32),
    Product(name: "Boost Blue", pop: "Neutral", rating: (4.7), reviews: 51, image: "Rumiis_Boost", price: 32),
    Product(name: "Boost Blue", pop: "Pop", rating: (5.0), reviews: 51, image: "Rumiis_Boostp", price: 32)
]
