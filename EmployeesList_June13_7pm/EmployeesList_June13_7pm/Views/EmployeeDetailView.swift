//
//  EmployeeDetailView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-08.
//

import Foundation

import SwiftUI

struct EmployeeDetailView1: View {
        
    @ObservedObject var viewModel: EmployeeDetailViewModel

    var body: some View {
        VStack {
                
            
            CustomImageView(urlString: viewModel.imageUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(75)
                    .padding()
            Text(viewModel.personName)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .navigationBarTitle(Text(viewModel.personName), displayMode: .inline)

    }
    
    init(person: Person) {
        self.viewModel = EmployeeDetailViewModel(person: person)
    }
    

}
