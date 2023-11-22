//
//  CartView.swift
//  Rumii App
//
//  Created by Jason Hennig on 7/25/23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            /* If products in cart, list products by unique element */
            if cartManager.products.count > 0 {
                ForEach(cartManager.products.uniqueElements, id: \.id) { product in
                    CartProductView(product: product, quantity: cartManager.quantity(of: product))
                }
                
                HStack {
                    Text("Cart Total:")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                PaymentButton(action: {})
                    .frame(height: 40)
                    .padding()
            }
            
            /* If no products in cart, let user know */
            else {
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}


/* make extension array of runique elements */
extension Array where Element: Hashable {
    var uniqueElements: [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
