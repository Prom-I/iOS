//
//  FriendGridView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/11.
//

import SwiftUI


struct FriendGridView: View {
    @State
    var friendArray = Friend.frinedArray
    
    @State var addFriendButtonIsActive: Bool = false
    
    var body: some View {
        // 스크롤뷰로 감싸서 스크롤 가능하도록 설정
        HStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {   // 가로 스크롤
                LazyHGrid(rows: [GridItem(.flexible())], content: {
                    ForEach(friendArray, content: { (friend: Friend) in
                        
                        FriendView(friend: friend)
                    })
                })
                .frame(height: 84)
            }
            
            NavigationLink(destination:AddFriendView()){
                ZStack {
                    Circle()
                        .frame(width: 60, height: 60)
                    
                    Text("+")
                        .font(Font.custom("Noto Sans", size: 20))
                        .foregroundColor(Color.mintColor)
                        .frame(width: 10.8, height: 24.3, alignment: .topLeading)
                }
                
            }.tint(Color.lightGray)
                .padding(.top, 4)
    
        }.padding(14)
          
            
    }
}

private struct FriendView: View {
    var friend: Friend
    fileprivate init(friend: Friend) {
        self.friend = friend
    }
    
    var body: some View {
        VStack(spacing: 4){
            Image(self.friend.profileImageString)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 1))
                    .foregroundColor(.gray)
            
            Text(self.friend.nickname)
                .font(.system(size: 14))
        }
    }
}

struct FriendGridView_Previews: PreviewProvider {
    static var previews: some View {
        FriendGridView()
            .previewLayout(.fixed(width: 434, height: 100))
    }
}
