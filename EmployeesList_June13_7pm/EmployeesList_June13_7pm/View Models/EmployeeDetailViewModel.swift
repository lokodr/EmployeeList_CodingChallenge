//
//  EmployeeDetailViewModel.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-12.
//

import Foundation
import SwiftUI

class EmployeeDetailViewModel: ObservableObject {
    
    @Published var person: Person

    var personName: String {
        person.name
    }

    var imageUrl: String {
        person.imageUrl
    }
    
    init(person: Person) {
        self.person = person
    }
}
