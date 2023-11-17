//
//  CartButton.swift
//  Rumii App
//
//  Created by Jason Hennig on 7/25/23.
//

import SwiftUI

struct CartButton: View {
    @ObservedObject var cartManager: CartManager
    var numberOfProducts: Int
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25, height: 25)
                .fontWeight(.medium)
                .padding(.trailing, 10)

            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(.red)
                    .cornerRadius(50)
            }
        }
    }
}
