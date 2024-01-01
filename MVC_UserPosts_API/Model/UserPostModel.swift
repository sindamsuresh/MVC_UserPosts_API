//
//  UserPostModel.swift
//  MVC_UserPosts_API
//
//  Created by Suresh Sindam on 12/28/23.
//

import Foundation


struct UserPostModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

