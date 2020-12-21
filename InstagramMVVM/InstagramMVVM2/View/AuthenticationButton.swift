//
//  AuthenticationButton.swift
//  InstagramMVVM2
//
//  Created by Mayuresh Rao on 12/19/20.
//

import UIKit

class AuthenticationButton: UIButton {
    init(buttonName: String, type buttonType: UIButton.ButtonType) {
        super.init(frame: .zero)
        setTitle(buttonName, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 5
        setHeight(50)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        //isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
