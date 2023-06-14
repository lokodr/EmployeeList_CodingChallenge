//
//  APIManager1.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-12.
//

import Foundation
import SwiftUI

class APIManager {
    
    static let shared = APIManager()

    func getRandomUsers(completion: @escaping (Result<[Person], APIError>) -> Void) {
        let urlString = Constants.url1
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.otherError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            do {
                if let response = try? JSONDecoder().decode(RandomUserResponse.self, from: data) {
                    let users = response.results.map { result in
                        let name = "\(result.name.first) \(result.name.last)"
                        let url = "\(result.picture.large)"
                        return Person(name: name, imageUrl: url)
                    }
                    completion(.success(users))
                }
            } catch {
                completion(.failure(APIError.otherError("")))
            }
        }.resume()
    }
}
