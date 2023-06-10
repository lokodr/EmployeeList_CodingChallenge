//
//  EmployeeDetailView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import Foundation

import SwiftUI

struct EmployeeDetailView: View {
    
    let employee: Employee
    
    var body: some View {
        VStack {
            Image(employee.avatarName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .cornerRadius(75)
                .padding()
            
            Text(employee.firstName)
                .font(.title)
                .fontWeight(.bold)
            Text(employee.lastName)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .navigationBarTitle(Text(employee.firstName + employee.lastName), displayMode: .inline)
    }
}
