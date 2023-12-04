//
//  UserListItemView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/15.
//

import SwiftUI

struct AddFriendListCell: View {
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
            Button(action: {
                
            }) {
                Text("친구 신청")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
            }
            .padding(EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 10))
            .background(Color.mintColor)
            .foregroundColor(Color.white)
            .cornerRadius(5)
        }
        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7))
        
    }
}

struct AddFriendListCell_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendListCell(user: Friend(profileImageString: "1", nickname: "유진"))
    }
}

