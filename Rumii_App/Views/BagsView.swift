//
//  BagsView.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI

struct BagsView: View {
    @EnvironmentObject var cartManager: CartManager
    
    /* Tabs initializers + animation */
    @State private var selectedTab: String = "Bags"
    @Namespace private var animation
    
    @State private var selectedQuantity: Int = 1
    
    
    // Filter & sorter
    enum FilterType {
        case none, pop, rating
    }
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 5)]
    
    var body: some View {
        NavigationStack{
            
            ScrollView{
                    
                    VStack(alignment: .leading){
                        
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVGrid(columns: columns, spacing: 5){
                                ForEach(productList, id: \.id){product in
                                    NavigationLink{
                                        ProductDetailView(product: product, selectedQuantity: selectedQuantity)
                                    } label: {
                                        ProductCard(product: product)
                                            .environmentObject(cartManager)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }

                    }
            }
        }
    }
}

struct BagsView_Previews: PreviewProvider {
    static var previews: some View {
        BagsView()
            .environmentObject(CartManager())
    }
}
