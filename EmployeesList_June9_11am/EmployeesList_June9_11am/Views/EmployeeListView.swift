//
//  EmployeeListView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import Foundation

import SwiftUI

struct EmployeeListView: View {
    
    @ObservedObject var viewModel: EmployeeViewModel
    @State private var isRefreshing = false

    var body: some View {
        
        NavigationView {
            
            if Constants.mockEmptyState {
                
                EmptyListView()
            }
            else {
                
                List(viewModel.filterEmployees(), id: \.firstName) { employee in
                    
                    NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                        
                        HStack(alignment: .center) {
                            
                            Image(employee.avatarName)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .clipped()
                            Text(employee.firstName + " " + employee.lastName)
                        }
                    }
                }
                .navigationBarTitle("Employee List")
                .searchable(text: $viewModel.searchText)
                .task {
                    await refreshData()
                }
            }
        }
        .refreshable {
            await refreshData()
        }
    }
    
    
    func refreshData() async {
        isRefreshing = true
        
        // Simulated API call delay
        await Task.sleep(1_000_000_000)
        await viewModel.fetchEmployees()

        isRefreshing = false
    }
}
