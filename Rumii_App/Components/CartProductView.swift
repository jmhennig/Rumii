//
//  ProductRow.swift
//  Rumii App
//
//  Created by Jason Hennig on 7/25/23.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    @State var selectedQuantity = 1
    @State private var rm = false
    let product: Product
    let quantity: Int
    
    var body: some View {
            HStack(spacing: 20) {
                
                /* Product image */
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(.lightGray))
                        .frame(width: 55, height: 55)
                        .cornerRadius(12)
                    
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .cornerRadius(10)
                }
                
                /* Product name & price */
                VStack(alignment: .leading, spacing: 10){
                    Text(product.name)
                        .bold()
                    
                    Text("$\(product.price)")
                        .font(.subheadline)
                }
                
                Spacer()
                
                /* Product quantity */
                Text("Quantity: \(quantity)")
                    .frame(alignment: .trailing)
                
                /* Remove from cart button */
                Button(action: {
                    cartManager.removeFromCart(product: product)
                    rm = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                            rm = false
                        }
                    }
                }, label: {
                    Image(systemName: "trash")
                        .foregroundColor(rm ? .brown : .red)
                })
            }
            .background(Color(.white))
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        /* Remove all button */
        Button(action: {
            rm = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                    rm = false
                }
                for _ in 0..<quantity {
                    cartManager.removeFromCart(product: product)
                }
            }
            
        }, label: {
            Text("Remove All")
                .foregroundColor(rm ? .brown : .red)
        })
    }
}
