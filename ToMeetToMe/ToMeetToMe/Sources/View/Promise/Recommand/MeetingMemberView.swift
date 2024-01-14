//
//  MeetingMemeberView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/11/26.
//

import SwiftUI

struct MeetingMemberView: View {
    
    let limitCnt = 5
    var availableFriends: [Friend] = []
    var unavailableFriends: [Friend] = []
    @State private var isSliderPresented = false
    
    init(availableFriends:[Friend], unavailableFriends : [Friend]) {
        self.availableFriends = availableFriends
        self.unavailableFriends = unavailableFriends
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer().frame(height: 16)
            
            HStack {
                Spacer().frame(width: 15)
                Text("가능한 친구")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                Spacer().frame(width: 15)
                createMemberListView(members: availableFriends)
            }
            
            Spacer().frame(height: 24)
            
            HStack {
                Spacer().frame(width: 15)
                Text("불가능한 친구")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                Spacer().frame(width: 15)
                createMemberListView(members:unavailableFriends)
            }
            
            Spacer()
        }
        .frame(width:286,height:224)
        .background(.white)
        .cornerRadius(8.0)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
    }
    
    func createMemberListView(members:[Friend]) -> some View {
        
        return LazyHGrid(rows: [GridItem(.flexible())], content: {
            var showCnt = members.count < limitCnt ? members.count : limitCnt
            ForEach(0..<showCnt) { index in
                let member = members[index]
                MemberView(member: member)
            }
            
            if (limitCnt < members.count) {
                Button(action: {
                    //버튼 동작 추가
                   
                }) {
                    ZStack {
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 32, height: 32) // 적절한 크기로 조절
                                
                        Text("+\(members.count - limitCnt)")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 14, trailing: 0))
            }
            
        })
        .frame(height: 50)
    
    }
}

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



