//
//  Home.swift
//  Rumii App
//
//  Created by Jason Hennig on 8/7/23.
//

import SwiftUI

struct ViewController: View {
    var columns = [GridItem(.adaptive(minimum: 180), spacing: 35)]
    @EnvironmentObject var cartManager: CartManager
    
    @State private var selectedTab: String = "Bags"
    @Namespace var animation
    
    var body: some View {
        
        NavigationStack{
            
            AppBar(cartManager: cartManager)
                .environmentObject(CartManager())
            
            ScrollView{
                
                VStack(alignment: .leading){
                    
                    /* Slider with header images */
                    HomeHeadSlider()
                        .shadow(radius: 5)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        HStack{
                            Spacer(minLength: 0)
                            TabButton(title: "Bags", selected: $selectedTab, animation: animation)
                            Spacer(minLength: 10)
                            TabButton(title: "Gallery", selected: $selectedTab, animation: animation)
                            Spacer(minLength: 10)
                            TabButton(title: "Customize", selected: $selectedTab, animation: animation)
                            Spacer(minLength: 10)
                            TabButton(title: "Contact", selected: $selectedTab, animation: animation)
                            Spacer(minLength: 0)
                        }
                        .padding(5)
                        .background(Color.white)
                        
                        switch selectedTab {
                        case "Bags":
                            BagsView()
                                .environmentObject(cartManager)
                        case "Gallery":
                            AboutView()
                        case "Customize":
                            CustomizeView()
                        case "Contact":
                            ContactView()
                        default:
                            BagsView()
                        }
                    }
                }
            }
            .environmentObject(CartManager())
            Spacer(minLength: 0)
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
            .environmentObject(CartManager())
    }
}
