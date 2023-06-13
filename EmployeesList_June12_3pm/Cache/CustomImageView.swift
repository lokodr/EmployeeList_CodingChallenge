//
//  CustomImageView.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-12.
//

import Foundation
import SwiftUI



struct CustomImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .task {
                await imageLoader.loadImage(for: urlString)
            }
    }
}
