//
//  AuthService.swift
//  InstagramMVVM2
//
//  Created by Mayuresh Rao on 12/20/20.
//

import UIKit
import Firebase
import FirebaseFirestore

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
}


struct AuthService {
    
    
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback? ){
  
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(withCredential crendential: AuthCredentials, completion: @escaping(Error?) -> Void) {
        ImageUploader.uploadImage(image: crendential.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: crendential.email, password: crendential.password) { (result, error) in
                if let error = error {
                    print("DEBUG: failed to register the user \(error.localizedDescription)")
                    return
                }
                guard let uid = result?.user.uid else { return }
                let data: [String: Any] = ["email": crendential.email,
                                          "fullName": crendential.fullName,
                                          "profileImageUrl": imageUrl,
                                          "uid": uid,
                                          "username": crendential.userName]
                Firestore.firestore().collection("users").document(uid).setData(data, completion:completion)
            }
        }
    }
}
    
