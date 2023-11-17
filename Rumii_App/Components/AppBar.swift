//
//  AppBar.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI


struct AppBar: View {
    @ObservedObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack{
            HStack{
                /* Menu Button */
                Button(action: {}) {
                    Image(systemName:
                            "line.horizontal.3.decrease")
                    .font(.system(size: 25, weight:
                            .heavy))
                    .foregroundColor(.black)
                    .padding(.leading, 8)
                }
                
                Spacer(minLength: 0)
                
                /* Rumii Icon */
                Image("Rumii-icon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                
                Spacer(minLength: 0)
                
                /* Cart Button */
                NavigationLink{
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(cartManager: cartManager, numberOfProducts: cartManager.products.count)

                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
            .background(Color.white)
        }
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar(cartManager: CartManager())
            .environmentObject(CartManager())
    }
}
