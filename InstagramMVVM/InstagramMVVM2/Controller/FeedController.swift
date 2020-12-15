//
//  FeedController.swift
//  InstagramMVVM2
//
//  Created by Mayuresh Rao on 12/13/20.
//

import UIKit

private let reuseableIdentifier = "Cell"

class FeedController: UICollectionViewController {
    
    // MARK :- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK : - Helpers
    
    func configureUI()  {
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseableIdentifier)

    }
    
        
}

// MARK: - UICollectionViewDataSource

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! FeedCell
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = width + 166
        return CGSize(width: width, height: height)
    }
}
