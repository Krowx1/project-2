//
//  ContentView.swift
//  project 2
//
//  Created by Krow on 9/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var startingTemp = 0.0
    @State private var endingTemp = 0.0
    @State private var startingMeasurement = "celsius"
    @State private var endingMeasurement = "celcius"
    
    
    
    //For the keyboard
    @FocusState private var amountIsFocused: Bool
    
    let measurements = ["celsius", "fahrenheit", "Kelvin"]
    
    var convertedTemp: Double {
        var newTemp = startingTemp
        // If starting and ending measurements match return the same value
        if startingMeasurement == "celsius" &&
            endingMeasurement == "celsius" {
            return newTemp
        }
        if startingMeasurement == "fahrenheit" &&
            endingMeasurement == "fahrenheit" {
            return newTemp
        }
        if startingMeasurement == "Kelvin" &&
            endingMeasurement == "Kelvin" {
            return newTemp
            
            
        }
        // Skipping celsius (Convering others to celsius)
        if startingMeasurement == "fahrenheit" {
            newTemp = (newTemp - 32) / 1.8
        } else if startingMeasurement == "Kelvin" {
            newTemp = newTemp - 237.15
        }
        
        // Converting from celsius to fahrenheit or Kelvin
        if startingMeasurement == "fahrenheit" {
            newTemp = newTemp * 1.8 + 32
        } else if startingMeasurement == "Kelvin" {
            newTemp = newTemp + 273.15
        }
        
        // Returns converted value
        return newTemp
    }
    var body: some View{
        NavigationStack{
            Form {
                Section("Select a starting temp") {
                    Picker("Temperature Measurement", selection: $startingMeasurement) {
                        ForEach(measurements, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Temp", value: $startingTemp, format: .number)
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                    
                }
                
                Section("Select a measurement to convert to"){
                    Picker("Temperature Measurement", selection: $endingMeasurement) {
                        ForEach(measurements, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(convertedTemp, format: .number)
                }
                .navigationTitle("Temperature Converter")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
                
            }
        }
    }
}

        
        #Preview{
            ContentView()
        }
    

