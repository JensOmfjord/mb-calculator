//
//  ContentView.swift
//  wb_calulator
//
//  Created by jens.omfjord on 02/11/2024.
//

import SwiftUI

struct ContentView: View {
    let tailNumbers = ["SE-LRO", "SE-LJO"]
    let emptyWeights = [381, 371]
    @State private var index = 0
    @State var weightPilot: Double = 0
    @State var weightCoPilot: Double = 0
    @State var weightCargo: Double = 0
    @State var weightFuel: Double = 0

    
    var body: some View {
        VStack {
            Text("Mass & Balance Calculator OFK")
            Form {
                Picker(selection: $index, label: Text("Tail")) {
                    ForEach(0 ..< tailNumbers.count) {
                        Text(self.tailNumbers[$0])
                    }
                }
                VStack {
                    Text("Pilot weight")
                    Slider(value: $weightPilot, in: 0...150, step: 1)
                    Text("\(weightPilot, specifier: "%.0f")")
                }
                VStack {
                    Text("Co-Pilot weight")
                    Slider(value: $weightCoPilot, in: 0...150, step: 1)
                    Text("\(weightCoPilot, specifier: "%.0f")")
                }
                VStack {
                    Text("Cargo weight")
                    Slider(value: $weightCargo, in: 0...20, step: 1)
                    Text("\(weightCargo, specifier: "%.0f")")
                }
                VStack {
                    Text("Fuel Weight")
                    Slider(value: $weightFuel, in: 0...71, step: 1)
                    Text("\(weightFuel, specifier: "%.0f")kg / \(weightFuel/0.72, specifier: "%.0f")l")
                }
            }
        }
        .padding()
        VStack {
            Text("MTOW 620 - TOW \(381 + weightPilot + weightCoPilot + weightCargo + weightFuel, specifier: "%.0f")")
            Text("CG \((weightPilot * 1.8 + weightCoPilot * 1.8 + weightCargo * 2.26 + weightFuel * 1.53))")
        }
    }
}

#Preview {
    ContentView()
}
