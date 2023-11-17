//
//  ProductCard.swift
//  Rumii App
//
//  Created by Jason Hennig on 7/24/23.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    @State var selectedQuantity = 1

    var body: some View {
        ZStack(alignment: .bottom){
            
            ZStack(alignment: .bottom){
                /* Product image */
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 45, trailing: 0))
                    .shadow(radius: 3)
                
                /* Like & add to card overlay buttons */
                VStack{
                    HStack(alignment: .top){
                        Button(action: {}) {
                            Image(systemName: "suit.heart")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .opacity(0)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            cartManager.addToCart(product: product, quantity: 1)}){
                                Image(systemName: "plus")
                                    .padding(8)
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .cornerRadius(50)
                            }
                    }
                    .padding(.bottom, 180)
                    .padding()
                    .frame(width: 180)
                }
            }
            
            
            /* Product card title/price/pop banner */
            
            VStack(alignment: .leading){
                HStack{
                    
                    Text(product.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                HStack{
                    Text(product.pop)
                        .font(.body)
                        .foregroundColor(Color(.gray))
                        .fontWeight(.medium)
                    
                    Spacer(minLength: 0)
                    
                    Text("$\(product.price)")
                        .font(.headline)
                        .fontWeight(.medium)
                }
            }
            .padding()
            .frame(width: 180, alignment: .leading)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 3)
        }
        .padding(.vertical, 5)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
