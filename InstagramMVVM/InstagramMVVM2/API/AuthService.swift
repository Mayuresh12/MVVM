//
//  AuthService.swift
//  InstagramMVVM2
//
//  Created by Mayuresh Rao on 12/20/20.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
}


struct AuthService {
    static func registerUser(withCredential crendential: AuthCredentials) {
        print("The Auth Credentilas are \(crendential.email)")
    }
}
