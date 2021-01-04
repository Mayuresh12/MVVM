//
//  ProfileController.swift
//  InstagramMVVM2
//
//  Created by Mayuresh Rao on 12/13/20.
//

import UIKit
import SDWebImage

private let ProfileCellIdentifier = "ProfileCell"
private let ProfileHeaderIdentifier = "ProfileHeader"
class ProfileController: UICollectionViewController {
    
    //MARK: Properties

    var user: User? {
        didSet { collectionView.reloadData() }
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        ConfigureCollectionView()
        fetchUser()
    }
    
    //MARK: Helpers
    
    func ConfigureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCellIdentifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeaderIdentifier)
    }
    
    
    //MARK: - API

    func fetchUser() {
        UserService.fetchUser { (User) in
            self.user = User
            self.navigationItem.title = self.user?.username
        }
    }
}

//MARK: - UICollectionViewDataSource

extension ProfileController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCellIdentifier, for: indexPath) as! ProfileCell
        return cell
}
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeaderIdentifier, for: indexPath) as! ProfileHeader
        print("DEBUG: called the header function")
        if let user = user {
            header.viewModel = ProfileHeaderViewModel(user: user)
        } else {
            print("DEBUG: the user is not set")
        }
        return header
    }
}

//MARK: - UICollectionViewDelegate

extension ProfileController{
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension ProfileController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}
