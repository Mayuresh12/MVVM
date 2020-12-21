//
//  AuthenticationViewModel.swift
//  InstagramMVVM2
//
//  Created by Mayuresh Rao on 12/19/20.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}
protocol AuthenticaitonViewModel {
    var formIsValid: Bool { get }
    var buttonBackGroundColor: UIColor { get }
    var buttonTitleColor: UIColor{ get }
    var buttonEnabled: Bool { get }
    
}

struct LoginViewModel: AuthenticaitonViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackGroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(white:1 ,alpha: 0.67)
    }
    
    var buttonEnabled: Bool {
        return formIsValid ? true : false
    }
    
}

struct RegistrationViewModel: AuthenticaitonViewModel {
    
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsValid: Bool{
        return  email?.isEmpty == false &&
            password?.isEmpty == false &&
            fullname?.isEmpty == false &&
            username?.isEmpty == false
        
    }
    
    var buttonBackGroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(white:1 ,alpha: 0.67)
    }
    
    var buttonEnabled: Bool {
        return formIsValid ? true : false
        
    }
}

