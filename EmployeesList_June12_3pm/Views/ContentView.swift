//
//  ContentView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = EmployeeListViewModel()
    @StateObject private var settingsViewModel = SettingsViewModel()

    var body: some View {
        
        TabView {
            
            EmployeeListView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Employees")
                }
            
            SettingsView(viewModel: settingsViewModel)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
