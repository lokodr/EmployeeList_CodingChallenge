//
//  EmployeeListView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import Foundation

import SwiftUI

    struct EmployeeListView: View {
        
        @ObservedObject var viewModel: EmployeeListViewModel
        @State private var isRefreshing = false

        var body: some View {

            NavigationView {
                
                if Constants.mockEmptyState {
                    
                    EmptyListView()
                }
                else {
                    
                    List(viewModel.filterEmployees1(), id: \.name) { person in
                        
                        NavigationLink(destination: EmployeeDetailView1(person: person)) {
                            
                            HStack(alignment: .center) {
                                

//                                if let personImage = person.image {
                                    // Display the image if available
                                CustomImageView(urlString: person.imageUrl)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(75)
                                        .padding()
  //                              }
                                
                                Text(person.name)
                            }
                        }
                    }
                    .navigationBarTitle("Employee List")
                    .searchable(text: $viewModel.searchText)
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
        
        private func delayText() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 70_500_000_000)
        }
    }
