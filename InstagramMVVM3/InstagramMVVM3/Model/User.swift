//
//  User.swift
//  InstagramMVVM3
//
//  Created by Mayuresh Rao on 5/26/21.
//

import Foundation

struct User {
    let email: String
    let fullName: String
    let profileImageUrl: String
    let username: String
    let uid: String
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as?  String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
