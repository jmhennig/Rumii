//
//  ProductDetailView.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    @State var selectedQuantity: Int
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    
                    Spacer()
                    
                    ZStack{
                        Color.white
                        
                        VStack(alignment: .leading){
                            ZStack(alignment: .topTrailing){
                                Image(product.image)
                                    .resizable()
                                    .ignoresSafeArea(edges: .top)
                                    .frame(height: 375)
                                    .shadow(radius: 10)
                                
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(.top, 63)
                                    .padding(.trailing, 20)
                            }
                            
                            VStack(alignment: .leading){
                                Group{
                                    HStack{
                                        Text(product.name)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                        
                                        Text("$\(product.price).00")
                                            .font(.title2)
                                            .fontWeight(.medium)
                                    }
                                    
                                    Spacer(minLength: 10)
                                    
                                    Ratings(product: product)
                                }
                                
                                Spacer(minLength: 20)
                                
                                Group{
                                    Text("Color")
                                    PopButtons()
                                    
                                    Spacer(minLength: 20)
                                    
                                    Text("Quantity")
                                        .padding(.bottom, 10)
                                    QuantityButton(selectedQuantity: $selectedQuantity)
                                }
                                
                                Spacer(minLength: 20)
                                
                                AddCartButton(selectedQuantity: $selectedQuantity, product: product)
                                
                                PaymentButton(action: {})
                                    .frame(height: 40)
                                    .cornerRadius(15)
                                
                                Spacer(minLength: 20)
                                
                                Group{
                                    Text("The Rumii Essential Bag combines utility, comfort, and style. Made from water-repellent polyester, this spacey bag features a main compartment, extra zipper pockets for phones and jewelry, an open pocket for scissors, and external adjustable loops for your badge and IV caps. The Essential Bag is made for nurses by nurses.")
                                        .font(.callout)
                                    
                                    Spacer(minLength: 20)
                                    
                                    Button(action: {
                                    }, label: {
                                        HStack(alignment: .center){
                                            Spacer()
                                            
                                            Text("Close")
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                    })
                                }
                            }
                            .frame(width: 350)
                            .padding()
                            .cornerRadius(20)
                            
                        }
                    }
                }
            }
            .navigationTitle(Text(product.name))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(cartManager: cartManager, numberOfProducts: cartManager.products.count)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

