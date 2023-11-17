//
//  AddCartButton.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI

struct AddCartButton: View {
    @EnvironmentObject var cartManager: CartManager
    @Binding var selectedQuantity: Int
    var product: Product
    
    var body: some View {
        Button(action: {
            cartManager.addToCart(product: product, quantity: selectedQuantity)
        }, label: {
            Text("Add to Cart")
                .font(.headline)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(15)
        })
    }
}
