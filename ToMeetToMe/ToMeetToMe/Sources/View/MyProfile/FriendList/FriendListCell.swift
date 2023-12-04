//
//  FriendListCell.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/22.
//


import SwiftUI

struct FriendListCell: View {
    var user: Friend
    
    init(user: Friend) {
        self.user = user
    }
    
    var body : some View {
        HStack {
            Image(self.user.profileImageString)
                .resizable()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 1))
                .foregroundColor(.gray)
                .padding(.trailing,10)
            VStack(alignment:.leading){
                Text(self.user.nickname)
                    .font(.system(size: 18))
                Text("#\(123/*self.user.id*/)")
                    .font(.system(size: 14))
            }
            Spacer()
            
        }
        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7))
        
    }
}

struct FriendListCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendListCell(user: Friend(profileImageString: "1", nickname: "유진"))
    }
}


