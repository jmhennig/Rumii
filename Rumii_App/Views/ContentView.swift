//
//  ContentView.swift
//  App
//
//  Created by Jason Hennig on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 180), spacing: 35)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 35) {
                    ForEach(productList, id: \.id) { product in ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding(50)
            }
            .navigationTitle(Text("Rumii Bags"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(cartManager: cartManager, numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
