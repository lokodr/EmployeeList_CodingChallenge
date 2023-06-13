//
//  RandomPerson.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-10.
//

import Foundation
import SwiftUI

class Person: Identifiable, ObservableObject {

    let id = UUID()
    let name: String
    let imageUrl: String
    @Published var image: UIImage?
    
    
    init(name: String, imageUrl: String) {
        self.name = name
        self.imageUrl = imageUrl
    }
}
