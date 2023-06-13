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
                
            if let personImage = viewModel.personImage {
                // Display the image if available
                Image(uiImage: personImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
            } else {
                // Show a placeholder image if image is not available
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .padding()
            }
            Text(viewModel.personName)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .navigationBarTitle(Text(viewModel.personName), displayMode: .inline)
        .onChange(of: viewModel.personImage) { newImage in
             // Handle the change in person.image
             // This closure will be called whenever the image property changes
             
             // Update the view or perform any other actions
             // For example, you can trigger a reload of the list view
             // to reflect the changes in the image
             // You can do this by invalidating the view model's objectWillChange publisher
         }
    }
    
    init(person: Person) {
        self.viewModel = EmployeeDetailViewModel(person: person)
    }
    

}
