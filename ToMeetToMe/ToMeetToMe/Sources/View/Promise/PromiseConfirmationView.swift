//
//  PromiseConfirmationView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/11/18.
//

import SwiftUI

// 약속 확정 화면
struct PromiseConfirmationView: View {
    
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                    .frame(height: 20)
                DateAndTimeView()
                PlaceView()
                ParticipantsView()
                Spacer()
            }
            .navigationTitle("그룹")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: BackButton(btnColor: .black),trailing: Button{} label: {
                Image(systemName: "ellipsis")
            }
            )
        }
    }
}

private struct DateAndTimeView: View {
    fileprivate var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("일시")
                    .font(.system(size: 14, weight: .bold))
                Text("08/28 (월) 09:30")
                    .font(.system(size: 16))
            }
            
            Spacer()
            Button {

            } label: {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.mintColor)
                    .overlay {
                        Text("확정")
                            .font(.system(size: 10))
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(width: 32, height: 20)
            }
        }
        .padding(.all, 20)
        .overlay{
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth:1)
                    .cornerRadius(10)
                }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

private struct PlaceView: View {
    fileprivate var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("장소")
                    .font(.system(size: 14, weight: .bold))
                Text("둥이 포차")
                    .font(.system(size: 16))
            }
            Spacer()
        }
        .padding(.all, 20)
        .overlay{
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth:1)
                    .cornerRadius(10)
                }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)

    }
}

private struct ParticipantsView: View {
    fileprivate var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("참여자")
                    .font(.system(size: 14, weight: .bold))
                LazyVGrid(columns: Array(repeating: GridItem(), count: 5), spacing: 10) {
                    ForEach(Friend.frinedArray) { friend in
                        ParticipantCellView(friend: friend)
                    }
                }
            }
            Spacer()
        }
        .padding(.all, 20)
        .overlay{
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth:1)
                    .cornerRadius(10)
                }
        .padding(20)
    }
}

private struct ParticipantCellView: View {
    @State var friend: Friend

    init(friend: Friend) {
        self.friend = friend
    }
    
    fileprivate var body: some View {
        Text(friend.nickname)
            .font(.system(size: 12))
            .frame(width: 52, height: 20)
            .background(Color("lightGray"))
            .cornerRadius(4, corners: .allCorners)
    }
}

struct PromiseConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseConfirmationView()
    }
}
