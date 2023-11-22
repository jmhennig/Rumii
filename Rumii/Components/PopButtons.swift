//
//  PopButtons.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI

struct PopButtons: View {
    @State private var neutralSelect = true
    @State private var popSelect = false
    
    var body: some View {
        HStack{
            Button(action: {
                neutralSelect.toggle()
                if popSelect == true {
                    popSelect.toggle()
                }
            }, label: {
                Text("Neutral")
                    .foregroundColor(neutralSelect ? .white : .black)
                    .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                    .background(neutralSelect ? .black : .white)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black)
                    )
            })
            
            Button(action: {
                popSelect.toggle()
                if neutralSelect == true {
                    neutralSelect.toggle()
                }
            }, label: {
                Text("Pop")
                    .foregroundColor(popSelect ? .white : .black)
                    .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                    .background(popSelect ? .black : .white)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black)
                    )
            })
            .padding(.leading, 10)
        }
    }
}

struct PopButtons_Previews: PreviewProvider {
    static var previews: some View {
        PopButtons()
    }
}
