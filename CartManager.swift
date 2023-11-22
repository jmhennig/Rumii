//
//  CartManager.swift
//  Rumii App
//
//  Created by Jason Hennig on 7/25/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0

    
    func addToCart(product: Product, quantity: Int) {
        for _ in 0..<quantity {
            products.append(product)
            total += product.price
        }
    }
    
    func quantity(of product: Product) -> Int {
        return products.filter {$0.id == product.id}.count
    }

    func removeFromCart(product: Product) {
        products.remove(at:
            products.firstIndex(where: { $0.id == product.id })!
        )
        total -= product.price
    }
}
