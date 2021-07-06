//
//  FeedController.swift
//  InstagramMVVM3
//
//  Created by Mayuresh Rao on 5/21/21.
//

import UIKit
import Firebase

class FeedController: UICollectionViewController {
    
    private let reuseIdentifier = "Cell"
    
    private var posts = [Post]() {
        didSet { collectionView.reloadData() }
    }
    
    var post: Post?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchPosts()
    }
    
    // MARK: API
    
    func fetchPosts() {
        guard post == nil else {
            return
        }
        PostService.fetchPosts{posts in
            self.posts = posts
            self.collectionView.refreshControl?.endRefreshing()
            self.checkIfUserLikedPosts()
        }
    }

    func checkIfUserLikedPosts() {
        self.posts.forEach { post in
            PostService.checkIfUserLikedPost(post: post) { dislike in
                if let index = self.posts.firstIndex(where: { $0.postId == post.postId}) {
                    self.posts[index].didLike = dislike
                }
                
            }
        }
    }
    
    // MARK: Actions
    
    @objc func handleRefresh(){
        posts.removeAll()
        collectionView.refreshControl?.endRefreshing()
        fetchPosts()
    }
    
    @objc func handleSignOUt () {
        do {
            try Auth.auth().signOut()
            let controller = LoginController()
            controller.delegate = self.tabBarController as? MainTabController
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        } catch  {
            print("DEBUG: failed to sign out.")
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        if post == nil {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout",
                                                               style: .plain,
                                                               target: self,
                                                               action: #selector(handleSignOUt))

        }
        
        navigationItem.title = "Feed"
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.refreshControl = refresher
    }
}

// MARK: - UICollectionViewDatasource
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post == nil ? posts.count : 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        
        cell.delegate = self
        if let post = post {
            cell.viewModel = PostViewModel(post: post)
            return cell
        } else {
            cell.viewModel = PostViewModel(post: posts[indexPath.row])
        }
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        var height = width +  8 + 40 + 8
        height += 110
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
}

//MARK: FeedCellDelegate

extension FeedController: FeedCellDelegate {
    func cell(_ cell: FeedCell, wantsToShowProfileFor uid: String) {
        UserService.fetchUser(withUid: uid) { user in
            let controller = ProfileController(user: user)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    
    func cell(_ cell: FeedCell, wantsToShowCommentsFor post: Post) {
        let controller = CommentController(post: post)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func cell(_ cell: FeedCell, didLike post: Post ) {
        cell.viewModel?.post.didLike.toggle()
        
        if post.didLike {
            PostService.unlikePost(post: post) { _ in
                cell.likeButton.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
                cell.likeButton.tintColor = .black
                cell.viewModel?.post.likes = post.likes - 1
            }
            
        } else {
            PostService.likePost(post: post) { error in
                cell.likeButton.setImage(#imageLiteral(resourceName: "like_selected"), for: .normal)
                cell.likeButton.tintColor = .red
                cell.viewModel?.post.likes = post.likes + 1
                
                NotificationService.uploadNotifications(toUid: post.ownerUid,
                                                        type: .like,
                                                        post: post)
            }
        }
    }

}
