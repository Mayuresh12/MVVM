//
//  ProfileHeaderViewModel.swift
//  InstagramMVVM2
//
//  Created by Mayuresh Rao on 1/4/21.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullName: String {
        return user.fullName
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}
