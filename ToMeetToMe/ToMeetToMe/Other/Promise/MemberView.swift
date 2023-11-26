//
//  MemberView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/11/26.
//

import SwiftUI

struct MemberView: View {
    var member: Friend
    init(member: Friend) {
        self.member = member
    }
    
    var body: some View {
        VStack(spacing: 4){
            Image(self.member.profileImageString)
                .resizable()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 1))
                    .foregroundColor(.gray)
            
            Text(self.member.nickname)
                .font(.system(size: 10))
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(member: Friend(profileImageString: "1", nickname: "유진"))
            .previewLayout(.fixed(width: 70, height: 90))
    }
}

