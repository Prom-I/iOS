//
//  LoginView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/11/10.
//

import SwiftUI
import GoogleSignInSwift

struct LoginView: View {
//     var userData: UserData
    
    var body: some View {
        VStack {
            TitleView()
            Spacer()
                .frame(height: 100)
            MainButtonView(buttonTitle: "3초만에 약속잡기")
                .padding(24)
            
            HStack(spacing: 32) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("kakao")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("apple")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("google")
                })
            }
        }
    }
}

private struct TitleView: View {
    fileprivate var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Image("loginTitle")
                Spacer()
                    .frame(height: 8)
                HStack(spacing: 0) {
                    Text("1초")
                        .bold()
                    Text("만에 잡는 약속,")
                        .font(.system(size: 16, weight: .light))
                }
                Text("ToMeetTome로 간편한 일정 관리")
                    .font(.system(size: 16, weight: .light))
                Text("지금 바로 시작하세요!")
                    .font(.system(size: 16, weight: .light))
                //            GoogleSignInButton(action:userData.signIn)
            }
            .padding(54)
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
