//
//  ContentView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import SwiftUI

struct ContentView: View {
    
    private var viewModel = ContentViewModel()

    var body: some View {
        
        TabView {
            
            EmployeeListView(viewModel: viewModel.employeeListViewModel)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Employees")
                }
            
            SettingsView(viewModel: viewModel.settingsViewModel)
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
