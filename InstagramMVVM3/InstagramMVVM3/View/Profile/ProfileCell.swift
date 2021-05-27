//
//  ProfileCell.swift
//  InstagramMVVM3
//
//  Created by Mayuresh Rao on 5/26/21.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    //MARK: Properties
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "venom-7")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
