//
//  APIResponse.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-13.
//

import Foundation


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
