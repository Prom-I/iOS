//
//  MyTabView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/10.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        // 탭뷰
        TabView{
            Group{
                HomeView()
                    .tabItem {
                        Image("ic_home")
                        Text("캘린더")
                    }
                    .tag(0)
                PromiseView()
                    .tabItem {
                        Image("ic_promise")
                        Text("약속")
                    }
                    .tag(1)
                ProfileView()
                    .tabItem {
                        Image("ic_person")
                        Text("내 정보")
                    }
                    .tag(2)
            }
                 
        }
        .accentColor(.mint) // 아이콘 클릭했을때 아이콘과 텍스트 색깔 민트로 설정
        .toolbarBackground(.blue, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
        
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
