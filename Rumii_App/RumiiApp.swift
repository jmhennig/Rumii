//
//  AppApp.swift
//  App
//
//  Created by Jason Hennig on 7/24/23.
//

import SwiftUI

@main
struct AppApp: App {
    @StateObject private var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            ViewController()
                .environmentObject(cartManager)
        }
    }
}
