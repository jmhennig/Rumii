//
//  HomeHeadSlider.swift
//  Rumii App
//
//  Created by Jason Hennig on 11/13/23.
//

import SwiftUI

struct HomeHeadSlider: View {
    @State private var currentIndex = 0
    var slides: [String] = ["hh1", "hh2", "hh3"]
    @State private var timer: Timer?
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack{
                Image(slides[currentIndex])
                    .resizable()
                    .scaledToFit()
        
                if currentIndex == 0 {
                    Text("Made For Nurses, By Nurses.")
                        .font(.title2)
                        .fontDesign(.rounded)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 8, y: 8)
                } else if currentIndex == 1 {
                    VStack(alignment: .leading){
                        Text("The Essential Bag For The Essential Worker.")
                            .font(.title2)
                            .fontDesign(.rounded)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .frame(width: 160)
                            .padding(.trailing, 200)
                            .shadow(color: .black, radius: 8, x: 6, y: 6)
                    }
                } else if currentIndex == 2 {
                    Text("Upgrade Your Uniform.")
                        .font(.title2)
                        .fontDesign(.rounded)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top, 75)
                        .shadow(color: .black, radius: 8, y: 6)
                }
            }
            
            HStack(alignment: .center){
                ForEach(0..<slides.count){index in
                    Circle()
                        .fill(self.currentIndex == index ? Color(.black) : Color(.gray))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(8)
        }
        .onAppear{
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
        private func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 7, repeats: true) { _ in
                DispatchQueue.main.async {
                    withAnimation {
                        if self.currentIndex + 1 == self.slides.count {
                            currentIndex = 0
                        } else {
                            self.currentIndex += 1
                        }
                    }
                }
            }
        }

        private func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
}

struct HomeHeadSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeadSlider()
    }
}

