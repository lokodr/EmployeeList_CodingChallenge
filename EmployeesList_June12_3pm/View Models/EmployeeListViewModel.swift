//
//  EmployeeViewModel.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import Foundation

import SwiftUI

class EmployeeListViewModel: ObservableObject {
    
    @Published var randomUsers: [Person] = []

    @Published var searchText = ""
    @Published var isLoading = false

    init() {
        if Constants.useMockData {
            //fetchEmployees_mock()
        }
        else {
            fetchEmployees()
        }
    }
    

    func fetchEmployees() {
        
        isLoading = true
        APIManager1.shared.getRandomUsers() { result in
            switch result {
            case .success(let randomUsers):
                // Handle successful response and use the fetched employees
                print("Fetched randomUsers:", randomUsers)
                // Update your UI or perform any other operations with the employees data
                            DispatchQueue.main.async {
                                self.isLoading = false
                                self.randomUsers = randomUsers
                            }
            case .failure(let error):
                // Handle error
                switch error {
                case .invalidURL:
                    print("error")
                    
                case .noData:
                    print("error")
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
    func filterEmployees1() -> [Person] {
        if searchText.isEmpty {
            return randomUsers
        } else {
            return randomUsers.filter { $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
}
