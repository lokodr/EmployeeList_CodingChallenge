//
//  Employee.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import Foundation
import SwiftUI

struct Employee: Identifiable, Decodable {
    
    let id: String
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
    let streetAddress: String
    let city: String
    let state: String
    let zip: String
    let avatarName: String
}

