//
//  GroupParticipantListView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 1/29/24.
//

import SwiftUI

struct GroupParticipantListView: View {
    @State var isShowing: Bool
    
    var body: some View {
        VStack {
            TitleView()
            AddGroupMemberButtonView()
            ScrollView(.horizontal, showsIndicators: false) {   // 가로 스크롤
                LazyVGrid(columns: [GridItem(.flexible())], content: {
                    ForEach(0...5, id: \.self) { _ in
                        GroupMemberView()
                    }
                })
            }
            Spacer()
            LeaveTheGroupButtonView()
        }
        .frame(width: 280)
        .background(.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

private struct AddGroupMemberButtonView: View {
    fileprivate var body: some View {
        HStack(spacing: 16) {
            Circle()
                .fill(Color.lightGray)
                .overlay {
                    Image("ic_round_plus")
                }
                .frame(width: 48, height: 48)
            
            Text("그룹 멤버 추가")
                .foregroundStyle(Color.mintColor)
            Spacer()
        }
        .font(.system(size: 15))
        .padding(.leading, 21)
        .padding(.vertical, 2)
    }
}

private struct GroupMemberView: View {
    fileprivate var body: some View {
        Button(action: {}) {
            HStack(spacing: 16) {
                Image("1")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    
                
                Text("이자민")
                Spacer()
            }
            .font(.system(size: 15))
            .padding(.leading, 21)
            .padding(.vertical, 2)
        }
        .foregroundStyle(Color.black)
    }
}

private struct TitleView: View {
    fileprivate var body: some View {
        HStack {
            Text("그룹 참여자 명단")
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }
        .padding(21)
    }
}

private struct LeaveTheGroupButtonView: View {
    fileprivate var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.strokeGray)
                .frame(height: 1)
                
            HStack {
                Text("그룹 나가기")
                    .foregroundStyle(Color.redColor)
                    .frame(height: 28)
                Spacer()
            }
            .padding(.vertical, 16)
            .padding(.leading, 28)
        }
        .font(.system(size: 15, weight: .regular))
        .background(Color.lightGray)
        
    }
}

#Preview {
    GroupParticipantListView(isShowing: true)
}
