//
//  MyFriends.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/10.
//

import SwiftUI

class Friend: ObservableObject, Identifiable, Comparable {
    let id = UUID()
    @Published var profileImageString: String
    @Published var nickname: String
    init(profileImageString: String, nickname: String) {
        self.profileImageString = profileImageString
        self.nickname = nickname
    }
    static func < (lhs: Friend, rhs: Friend) -> Bool {
           return lhs.nickname < rhs.nickname
    }
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Friend {
    
    static var frinedArray: [Friend] {
        (1...10).map { (number: Int) in
            Friend(profileImageString: "\(number)", nickname: "친구\(number)")
        }
    }
}
