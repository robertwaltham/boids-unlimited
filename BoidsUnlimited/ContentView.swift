//
//  ContentView.swift
//  BoidsUnlimited
//
//  Created by Robert Waltham on 2022-03-21.
//

import SwiftUI

struct ContentView: View {
    
    @State var alignCoef: Float = 0.3
    @State var cohereCoef: Float = 0.4
    @State var separateCoef: Float = 0.5

    @State var count = 16384
    @State var radius: Float = 15
    @State var maxSpeed: Float = 5
    @State var drawSize: Float = 2
        
    @State var started: Bool
    
    var boid_counts = [128, 256, 512, 1024, 2048, 8192, 16384, 32768, 65536]
    
    var body: some View {

        if (started) {
            VStack() {
                
                HStack(alignment: .center, spacing: 15) {
                    VStack {
                        Text("align: \(alignCoef, specifier: "%.2f")")
                            .font(.title)
                        Slider(value: $alignCoef, in: 0...1)
                    }
                    VStack {
                        Text("cohere: \(cohereCoef, specifier: "%.2f")")
                            .font(.title)
                        Slider(value: $cohereCoef, in: 0...1)
                    }
                    VStack {
                        Text("separate: \(separateCoef, specifier: "%.2f")")
                            .font(.title)
                        Slider(value: $separateCoef, in: 0...1)
                    }
                }.padding(5)
                
                MetalView(alignCoefficient: $alignCoef,
                          cohereCoefficient: $cohereCoef,
                          separateCoefficient: $separateCoef, drawSize: $drawSize, count: $count, radius: $radius, maxSpeed: $maxSpeed)
                .border(.cyan, width: 1).padding(2)
                
                HStack(alignment: .center, spacing: 15) {
                    VStack {
                        Text("radius: \(radius, specifier: "%.2f")")                            .font(.title)
                        Slider(value: $radius, in: 0...50)
                    }

                    VStack {
                        Text("speed: \(maxSpeed, specifier: "%.2f")")                            .font(.title)
                        Slider(value: $maxSpeed, in: 0...10)
                    }
                    
                    Button(action: {
                        started = false
                    }) {
                        HStack {
                            Image(systemName: "stop")
                                .font(.title)
                        }
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(40)
                    }
                }.padding(10)
            }
        } else {
            VStack() {
                LazyVStack() {

                    Text("Boid Count")                            .font(.title)

                    Picker("Boids", selection: $count) {
                        ForEach(boid_counts, id: \.self) {
                            Text("\($0.formatted(.number.grouping(.never)))")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding(20)
                }.padding([.trailing, .leading], 100)

                    
                Button(action: {
                    started = true
                }) {
                    HStack {
                        Image(systemName: "play")
                            .font(.title)
                        Text("Start")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                }
                
                VStack() {
                    Text("draw size: \(Int(drawSize))")                            .font(.title)
                    Slider(value: $drawSize, in: 1...5)
                }.frame(width: 300, height: 200, alignment: .leading)
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(started: false)
        ContentView(started: true)

    }
}
