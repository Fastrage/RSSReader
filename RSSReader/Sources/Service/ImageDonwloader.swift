//
//  ImageDonwloader.swift
//  RSSReader
//
//  Created by Олег Крылов on 04/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//

import UIKit
protocol iImageDownloader {
    func getPhoto(url:URL?, completion: @escaping (_ image:UIImage?, _ error:Error?) -> Void)
}

class ImageDownloader: iImageDownloader {
    let cache = URLCache.shared
    func getPhoto(url:URL?, completion: @escaping (_ image:UIImage?, _ error:Error?) -> Void)  {
        
        if url == nil {
            print("error")
        } else {
            
            let request = URLRequest(url: url!)
            
            if let data = self.cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                completion(image, nil)
            } else {
                let config = URLSessionConfiguration.default
                let session = URLSession(configuration: config)
                let task = session.downloadTask(with: url!)  { imageUrl, response, error in
                    
                    guard error == nil else {
                        print("error: \(error!)")
                        completion(nil, error)
                        return
                    }
                    guard let content = imageUrl else {
                        print("no data")
                        return
                    }
                    guard let data = try? Data.init(contentsOf: content) else {
                        return
                    }
                    guard let image = UIImage.init(data: data) else {
                        return
                    }
                    guard let respone = response else {
                        print("no response")
                        return
                    }
                    let cachedData = CachedURLResponse(response: respone, data: data)
                    self.cache.storeCachedResponse(cachedData, for: request)
                    completion(image, nil)
                }
                task.resume()
            }
        }
    }
}

