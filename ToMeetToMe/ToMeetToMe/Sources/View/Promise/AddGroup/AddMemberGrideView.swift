//
//  AddMemberGrideView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/15.
//

import SwiftUI

// MARK: - 추가된 멤버
struct AddMemberGrideView: View {
    @Binding var groupMemberList:[Friend]
    
    var body: some View {
        HStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {   // 가로 스크롤
                LazyHGrid(rows: [GridItem(.flexible())], content: {
                    ForEach(groupMemberList, content: { (member: Friend) in
                        AddMemberView(member: member)
                    })
                })
                .frame(height: 84)
            }
    
        }.padding(12)
          
    }
}

struct AddMemberView: View {
    var member: Friend
   
    init(member: Friend) {
        self.member = member
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 4){
                Image(self.member.profileImageString)
                    .resizable()
                    .frame(width: 52, height: 52)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 1))
                        .foregroundColor(.gray)
                
                Text(self.member.nickname)
                    .font(.system(size: 14))
            }
            DeleteMemberButton(member: member)
                .offset(x: 20, y: -30)
        }
    }
    
    struct DeleteMemberButton:View {
        var member:Friend
        @Environment(\.presentationMode) var presentationMode
        var body: some View {
            Button(action: {
                //TODO: 멤버 삭제 버튼 눌렀을 때 처리
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "editMemberList"), object: nil, userInfo: ["member": member])
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "btnStateChange"), object: nil, userInfo: ["member": member])
            }) {
                Image(systemName: "xmark")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .font(Font.system(size: 10).weight(.bold))
            }
            .padding(5)
            .background(.red)
            .cornerRadius(100)
        }
    }
}

