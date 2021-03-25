//
//  ContentView.swift
//  Insta Post 1(Loading Animation)
//
//  Created by Dhruvil Patel on 2021-03-08.
//

import SwiftUI

struct ContentView: View {
    
    let circleSize: CGFloat = 30
    let count: Int = 6
    let color = RadialGradient(gradient: Gradient(colors: [.blue, .yellow]), center: .center, startRadius: 0, endRadius: 115)
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack{
            Circle()
                .fill(color)
                .frame(width: circleSize, height: circleSize)
            
            ForEach(0..<count) { i in
                Circle()
                    .trim(from: 0.0, to: 0.1 + CGFloat(i/6))
                    .stroke(color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: circleSize + 20 + CGFloat(i*30), height: circleSize + 20 + CGFloat(i*30))
                    .rotationEffect(.degrees(rotation))
                    .animation(Animation.linear(duration: 3.0 / Double(count - i))
                                .repeatForever(autoreverses:false))
                
            }
        }
        .onAppear(){
            rotation = -360
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
