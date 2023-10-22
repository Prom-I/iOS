//
//  MyPageView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/22.
//


import SwiftUI

struct MyPageView: View {
    
    @State var array = Friend.frinedArray
    
    var body: some View {
        GeometryReader { geometry in // GeometryReader를 사용하여 화면 크기를 얻음
            VStack(spacing: 30){
                Button(action: {
                }) {
                    HStack {
                        Spacer()
                        Text("프로필 수정")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(8)
                }
                .background(Color.lightGray)
                .cornerRadius(7)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                
                HStack(spacing:18){
                    Spacer() // 왼쪽에 공백 추가
                    NavigationLink(destination:FriendListView()){
                        CardView(width: geometry.size.width/2-28, height: 65, icon: "person.2.fill", mainText: "친구목록", subText: "\(array.count)")
                    }.tint(Color.black)
                    Spacer() // 왼쪽에 공백 추가
                    NavigationLink(destination:FriendListView()){
                        CardView(width: geometry.size.width/2-28, height: 65, icon: "wand.and.stars", mainText: "형광펜 목록", subText: "1개")
                    }.tint(Color.black)
                    Spacer() // 왼쪽에 공백 추가
                }
            }.padding(.top)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}



