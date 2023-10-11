//
//  FriendView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/11.
//

import SwiftUI

struct FriendView: View {
    var friend: Friend
    init(friend: Friend) {
        self.friend = friend
    }
    
    var body: some View {
        VStack(spacing: 4){
            Image(self.friend.profileImageString)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 1))
                    .foregroundColor(.gray)
            
            Text(self.friend.nickname)
                .font(.system(size: 14))
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(friend: Friend(profileImageString: "1", nickname: "유진"))
    }
}
