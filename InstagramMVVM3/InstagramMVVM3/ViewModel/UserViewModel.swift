//
//  UserViewModel.swift
//  InstagramMVVM3
//
//  Created by Mayuresh Rao on 5/27/21.
//

import Foundation

struct UserCellViewModel {
    
    private let user: User
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var username: String {
        return user.username
    }
    
    var fullname: String {
        return user.fullName
    }
    
    init(user: User) {
        self.user = user
    }
}
