//
//  ContentView.swift
//  WeSplit
//
//  Created by Isay Lucas on 27/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var CheckAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 10

    let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
                
                Section {
                    TextField("Amount", value: $CheckAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }

                Section {
                    Text(CheckAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            }.navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
