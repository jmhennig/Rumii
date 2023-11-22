//
//  QuantityButton.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI

struct QuantityButton: View {
    @EnvironmentObject var cartManager: CartManager
    @Binding var selectedQuantity: Int
    
    @State private var subtract = false
    @State private var add = false
    
    var body: some View {
        ZStack {
            
            Color.white
                .clipShape(Rectangle())
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black)
                )

            HStack{
                Button(action: {
                    if selectedQuantity >= 2 {
                        selectedQuantity -= 1
                    }
                    else{
                        selectedQuantity = 1
                    }
                    subtract = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            subtract = false
                        }
                    }
                }, label: {
                    Image(systemName: "minus")
                        .foregroundColor(subtract ? .white : .black)
                        .frame(width: 25, height: 30)
                        .background(subtract ? .black : .white)
                        .cornerRadius(15)
                })
                
                Spacer()
                
                TextField("\(selectedQuantity)", value: $selectedQuantity, format: .number)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    selectedQuantity += 1
                    add = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            add = false
                        }
                    }
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(add ? .white : .black)
                        .frame(width: 25, height: 30)
                        .background(add ? .black : .white)
                        .cornerRadius(15)
                })
                
            }
            .padding(.horizontal, 10)
        }
        .frame(width: 140, height: 40)
    }
}
