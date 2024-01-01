//
//  Services.swift
//  MVC_UserPosts_API
//
//  Created by Suresh Sindam on 12/30/23.
//

import Foundation

class Services {
    
    static let shared = Services()
    
    private init() {}
    
    func getUserPosts(completion: @escaping([UserPostModel]?) ->Void) {
        let apiURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: apiURL) { data, result, error in
            guard let data = data, error == nil else {
                print("Error fetching data:\(error?.localizedDescription ?? "error")")
                completion(nil)
                return
            }
            
            do {
                let decodeResponse = try JSONDecoder().decode([UserPostModel].self, from: data)
                completion(decodeResponse)
            } catch{
                print("Error json decoding: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
