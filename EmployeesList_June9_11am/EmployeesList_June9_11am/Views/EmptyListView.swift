//
//  EmptyListView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-09.
//

import Foundation
import SwiftUI


struct EmptyListView: View {
    
    var body: some View {
        
        VStack {
            
            Text("No employees found")
                .font(.headline)
                .foregroundColor(.gray)
            Text("Please try again later.")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
