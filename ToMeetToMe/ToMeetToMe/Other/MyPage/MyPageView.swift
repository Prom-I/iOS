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
                HStack(spacing:10){
                    Image("1")
                        .resizable()
                        .frame(width:65, height: 65)
                        .clipShape(Circle())
                    Text("이자민#1234")
                        .fontWeight(.bold)
                    Spacer()
                }.padding(EdgeInsets(top: -10, leading: 30, bottom: 0, trailing: 0))
                
        
                NavigationLink(destination:SettingProfileView()){
                    HStack {
                        Spacer()
                        Text("프로필 수정")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(8)
                    
                }.background(Color.lightGray)
                    .cornerRadius(7)
                    .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 20))
                
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
                
                HStack {
                    VStack(spacing:20){
                        Text("상태관리")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 0, leading: -12, bottom: 0, trailing: 0))
                     
                        Button(action: {
                            
                        }) {
                            Text("로그아웃")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                        }
                        
                        Button(action: {
                            
                        }) {
                            Text("회원탈퇴")
                                .font(.system(size: 16))
                                .foregroundColor(.red)
                        }
                     
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 45, leading: 20, bottom: 0, trailing: 0))
                
                
            }.padding(.top)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}



