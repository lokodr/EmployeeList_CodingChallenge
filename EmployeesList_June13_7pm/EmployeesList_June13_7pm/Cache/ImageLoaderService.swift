//
//  ImageLoaderService.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-13.
//

import Foundation
import SwiftUI


class ImageLoaderService: ObservableObject {
    
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) async {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                Task {

                    await Task.sleep(1_500_000_000)
                    self.image = UIImage(data: data) ?? UIImage()
                }

            }
        }
        task.resume()
    }
    
}
