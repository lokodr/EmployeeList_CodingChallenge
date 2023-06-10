//
//  EmployeeViewModel.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import Foundation

import SwiftUI


class EmployeeViewModel: ObservableObject {
    
    @Published var employees: [Employee] = []
    @Published var searchText = ""
    @Published var isLoading = false
    

    init() {
        if Constants.useMockData {
            fetchEmployees_mock()
        }
        else {
            fetchEmployees()
        }
    }
    
    // Method to fetch employee data
    func fetchEmployees_mock() {
        
        isLoading = true
        
        // Simulated asynchronous API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.employees = MockData.getEmployees()
            self.isLoading = false
        }
    }

    func fetchEmployees() {
        
        isLoading = true

        APIManager.shared.fetchEmployees { result in
            switch result {
            case .success(let employees):
                // Handle successful response and use the fetched employees
                print("Fetched employees:", employees)
                // Update your UI or perform any other operations with the employees data
                            DispatchQueue.main.async {
                                self.isLoading = false
                                var shuffledemployees = employees
                                shuffledemployees.shuffle()
                                self.employees = shuffledemployees
                            }
            case .failure(let error):
                // Handle error
                switch error {
                case .emptyResponse:
                    // Handle empty response error
                    print("Empty response error")
                    // Show an alert or display an appropriate message to the user
                    
                case .decodingError:
                    // Handle decoding error
                    print("Decoding error")
                    // Show an alert or display an appropriate message to the user
                    
                case .otherError(let errorMessage):
                    // Handle other error with the provided error message
                    print("Other error:", errorMessage)
                    // Show an alert or display an appropriate message to the user
                }
            }
        }
    }
    
    // Filter employees based on search text
    func filterEmployees() -> [Employee] {
        if searchText.isEmpty {
            return employees
        } else {
            return employees.filter { $0.firstName.localizedCaseInsensitiveContains(searchText) ||  $0.lastName.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
