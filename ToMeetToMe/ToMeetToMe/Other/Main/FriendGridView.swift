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
                LazyHGrid(rows: [GridItem(.fixed(3))], content: {
                    ForEach(friendArray, content: { (friend: Friend) in
                        
                        FriendView(friend: friend)
                    })
                })
                .frame(height: 80)
            }
            
            Button(action: {
                print("click")
                addFriendButtonIsActive = true
            })
            {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                    
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

struct FriendGridView_Previews: PreviewProvider {
    static var previews: some View {
        FriendGridView()
    }
}
