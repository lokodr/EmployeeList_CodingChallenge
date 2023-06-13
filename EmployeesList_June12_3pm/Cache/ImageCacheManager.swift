//
//  ImageCacheManager.swift
//  EmployeesList_June8_7pm
//
//  Created by WiseMac on 2023-06-12.
//

import Foundation
import SwiftUI

class ImageCacheManager {
    
    static let shared = ImageCacheManager()
    private let fileManager = FileManager.default
    private let cacheDirectory: URL
    
    private init() {
        // Create a directory for image caching
        guard let cacheDirectoryURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            fatalError("Unable to access the caches directory.")
        }
        
        let uniqueCacheDirectoryName = "ImageCache EmployeeList"
        cacheDirectory = cacheDirectoryURL.appendingPathComponent(uniqueCacheDirectoryName)
        
        do {
            try fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            fatalError("Failed to create image cache directory.")
        }
    }
    
    func saveImageToCache(image: UIImage, forKey key: String) {
        let fileURL = cacheDirectory.appendingPathComponent(key)
        
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            return
        }
        
        fileManager.createFile(atPath: fileURL.path, contents: imageData, attributes: nil)
    }
    
    func getImageFromCache(forKey key: String) -> UIImage? {
        let fileURL = cacheDirectory.appendingPathComponent(key)
        
        guard fileManager.fileExists(atPath: fileURL.path),
              let imageData = fileManager.contents(atPath: fileURL.path),
              let image = UIImage(data: imageData) else {
            return nil
        }
        
        return image
    }
}
