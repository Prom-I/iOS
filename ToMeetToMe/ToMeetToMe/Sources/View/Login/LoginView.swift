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
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
                .frame(height: 150)
            Text("투밋투미")
                .font(.title).bold()
                .foregroundColor(.mintColor)
            HStack(spacing: 0) {
                Text("1초")
                    .bold()
                Text("만에 잡는 약속,")
            }
            Text("ToMeetTome로 간편한 일정 관리\n지금 바로 시작하세요!")
            
            Spacer()
//            GoogleSignInButton(action:userData.signIn)
        }
        .padding(.horizontal, 2)
        .frame(width: UIScreen.main.bounds.width)
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
