//
//  Ratings.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI

struct Ratings: View {
    var product: Product
    
    var body: some View {
        HStack {
            ForEach(0..<Int(product.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.callout)
                    .padding(0)
            }
            if product.rating.truncatingRemainder(dividingBy: 1) != 0 {
                Image(systemName: "star.lefthalf.fill")
                    .foregroundColor(.yellow)
                    .font(.callout)
                    .padding(0)
            }
            Text("(\(product.rating))")
                .font(.callout)
                .foregroundColor(.gray)
        }
    }
}
