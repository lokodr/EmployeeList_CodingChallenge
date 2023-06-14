//
//  APIError.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-13.
//

import Foundation


enum APIError: Error {
    case invalidURL
    case noData
    case emptyResponse
    case decodingError
    case otherError(String)
}
