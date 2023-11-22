//
//  AboutView.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI

struct AboutView: View {
    @State private var visibleItems: [String] = []
    
    var body: some View {
        ScrollViewReader { proxy in
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack {
                        topImage()
                        Image("essentials")
                            .resizable()
                            .frame(width: 425, height: 425)
                        Image("swipe-clean")
                            .resizable()
                            .frame(width: 425, height: 425)
                        Image("loop")
                            .resizable()
                            .frame(width: 425, height: 425)
                        Image("scissors")
                            .resizable()
                            .frame(width: 425, height: 425)
                        Image("snap-on")
                            .resizable()
                            .frame(width: 425, height: 425)
                        Image("extra-pocket")
                            .resizable()
                            .frame(width: 410, height: 410)
                    }
                }
                
                let selectedID = "top"
                // If top item is not in visibleItems (therefore not visible) then make the button appear
                if !visibleItems.contains(selectedID) {
                    Button {
                        withAnimation {
                            proxy.scrollTo(selectedID)
                        }
                    } label: {
                        VStack{
                            Image(systemName: "chevron.up")
                            Text("Back to Top")
                        }
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.black.opacity(0.5))
                        .fontWeight(.semibold)
                    }
                    .padding(.top, 50)
                }
            }
        }
    }
    
    func topImage() -> some View {
        Image("rumii-spread")
            .resizable()
            .frame(width: 400, height: 400)
            .id("top")
            .onAppear {
                visibleItems.append("top")
            }
            .onDisappear {
                visibleItems.removeAll(where: {$0 == "top"})
            }
    }

}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
