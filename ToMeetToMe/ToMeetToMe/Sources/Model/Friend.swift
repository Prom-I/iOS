//
//  MyFriends.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/10.
//

import SwiftUI

class Friend: ObservableObject, Identifiable, Comparable, Codable {
    let id = UUID()
    @Published var profileImageString: String
    @Published var nickname: String
    
    enum CodingKeys: CodingKey {
        case profileImageString,
             nickname
    }
    
    init(profileImageString: String, nickname: String) {
        self.profileImageString = profileImageString
        self.nickname = nickname
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        profileImageString = try container.decode(String.self, forKey: .profileImageString)
        nickname = try container.decode(String.self, forKey: .nickname)
    }
    
    static func < (lhs: Friend, rhs: Friend) -> Bool {
           return lhs.nickname < rhs.nickname
    }
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.id == rhs.id
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(profileImageString, forKey: .profileImageString)
        try container.encode(nickname, forKey: .nickname)
    }
    
}

extension Friend {
    
    static var frinedArray: [Friend] {
        (1...6).map { (number: Int) in
            Friend(profileImageString: "\(number)", nickname: "친구\(number)")
        }
    }
}
