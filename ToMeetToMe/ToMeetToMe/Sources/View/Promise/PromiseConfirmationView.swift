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
                    .frame(height: 30)
                DateAndTimeView()
                PlaceView()
                ParticipantsView()
                DeleteFromListButtonView()
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("1차 회의")   // 약속 이름
                            .font(.system(size: 18))
                        Image("check")
                    }
                }
            }
            .navigationBarItems(leading: BackButton(btnColor: .black),trailing: Button{} label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.black)
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
//            ConfirmationLabelView()
            FinishLabelView()
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

private struct ConfirmationLabelView: View {
    fileprivate var body: some View {
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

private struct FinishLabelView: View {
    fileprivate var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color("textGray"))
            .overlay {
                Text("완료")
                    .font(.system(size: 10))
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(width: 32, height: 20)
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
                HStack(spacing: 4) {
                    Text("참여자")
                    Text("12")  // 참여자수
                        .foregroundStyle(Color("textGray"))
                }
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
            .font(.system(size: 11))
            .frame(width: 52, height: 18)
            .background(Color("lightGray"))
            .cornerRadius(4, corners: .allCorners)
    }
}

private struct DeleteFromListButtonView: View {
    fileprivate var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
            Text("목록에서 삭제하기")
                .foregroundStyle(Color("red"))
                Spacer()
            }
            .frame(height: 46)
        }
        .background(Color("lightGray"))
        .cornerRadius(12, corners: .allCorners)
        .padding(.horizontal, 28)
        .padding(.top, 30)
        
    }
}

struct PromiseConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseConfirmationView()
    }
}
