//
//  ProfileCell.swift
//  InstagramMVVM2
//
//  Created by Mayuresh Rao on 12/23/20.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    //MARK: Properties
    
    //MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
