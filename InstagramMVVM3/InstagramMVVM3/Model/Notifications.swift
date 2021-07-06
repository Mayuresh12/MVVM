//
//  Notifications.swift
//  InstagramMVVM3
//
//  Created by Mayuresh Rao on 7/6/21.
//

import Firebase

enum NotificationType: Int {
    case like
    case follow
    case comment
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked your post."
        case .follow: return " started following your post."
        case .comment: return " commented on your post."
    }
}

struct Notification {
    let uid: String
    let postImageUrl: String?
    let postId: String?
    let timestamp: Timestamp
    let type: NotificationType
    
    init( dictionary: [String: Any]) {
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date)
        self.id = dictionary["id"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.postId = dictionary["postId"] as? String ?? ""
        self.postImageUrl = dictionary["postImageUrl"] as? String ?? ""
        self.type = NotificationType(rawValue: dictionary["type"] as? Int ?? 0) ?? .like
    }
}
