//
//  APIManager1.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-12.
//

import Foundation
import SwiftUI

class APIManager1 {
    
    static let shared = APIManager1()

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
                    let users = try response.results.map { result in
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

enum APIError: Error {
    case invalidURL
    case noData
    case emptyResponse
    case decodingError
    case otherError(String)
}

struct RandomUserResponse: Codable {
    let results: [RandomUserResult]
}

struct RandomUserResult: Codable {
    let name: RandomUserName
    let picture: RandomUserPicture
}

struct RandomUserName: Codable {
    let first: String
    let last: String
}

struct RandomUserPicture: Codable {
    let large: URL
}
