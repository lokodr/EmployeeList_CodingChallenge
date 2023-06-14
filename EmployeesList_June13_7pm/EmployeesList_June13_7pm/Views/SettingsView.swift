//
//  SettingsView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import Foundation

import SwiftUI

import SwiftUI

struct SettingsView: View {
    
    @State private var knobValue: Double = 0.5
    @State private var switchOn: Bool = false
    @State private var sliderValue: Double = 0.5
    @State private var stepperValue: Int = 1
    @State private var selectedSegment: Int = 0
    
    @ObservedObject var viewModel: SettingsViewModel

    
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.title)
                .fontWeight(.bold)

            VStack(spacing: 10) {

                Picker(selection: $selectedSegment, label: Text("Segmented Control")) {
                    Text("Option 1").tag(0)
                    Text("Option 2").tag(1)
                    Text("Option 3").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button(action: {
                // Perform some action
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
