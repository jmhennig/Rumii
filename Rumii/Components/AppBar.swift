//
//  AppBar.swift
//  Rumii App
//
//  Created by Jason Hennig on 9/8/23.
//

import SwiftUI


struct AppBar: View {
    @StateObject var cartManager = CartManager()
    
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
                        .foregroundColor(.black)
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
            .background(Color.white)
        }
    }
}
