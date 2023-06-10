//
//  APIManager.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-09.
//

import Foundation


class APIManager {
    
    static let shared = APIManager()

    enum APIError: Error {
        case emptyResponse
        case decodingError
        case otherError(String)
    }

    func fetchEmployees(completion: @escaping (Result<[Employee], APIError>) -> Void) {
        
        guard let url = URL(string: Constants.url) else {
            // Handle invalid URL
            completion(.failure(.otherError("Invalid URL")))
            return
        }
        
        if Constants.simulateFailure {
            
            let shouldFail = shouldSimulateFailure() // Determine if failure should be simulated
            
            if shouldFail {
                return
            }
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // Handle error
                print("Error: \(error.localizedDescription)")
                completion(.failure(.otherError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                // Handle empty response
                print("Empty response")
                completion(.failure(.emptyResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let apiResponse = try decoder.decode([Employee].self, from: data)
                completion(.success(apiResponse))
            } catch {
                // Handle decoding error
                print("Decoding error: \(error.localizedDescription)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}

extension APIManager {
    
    func shouldSimulateFailure() -> Bool {
        // Simulate a 1/3 chance of failure
        return Int.random(in: 0..<3) == 0
    }

    func simulateFailure(completion: @escaping (Result<[Employee], APIError>) -> Void) {
        // Simulate failure
        let error = APIError.otherError("API request failed")
        print("Simulated failure")
        completion(.failure(error))
    }

}
