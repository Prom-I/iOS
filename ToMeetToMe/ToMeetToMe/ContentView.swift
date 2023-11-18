//
//  ContentView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/09.
//

import SwiftUI
import GoogleSignInSwift

struct ContentView: View {
    @EnvironmentObject var userAuth: UserAuthModel
    
    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Spacer()
//                .frame(height: 150)
//            Text("투밋투미")
//                .font(.title).bold()
//                .foregroundColor(.mintColor)
//            HStack(spacing: 0) {
//                Text("1초")
//                    .bold()
//                Text("만에 잡는 약속,")
//            }
//            Text("ToMeetTome로 간편한 일정 관리\n지금 바로 시작하세요!")
//
//            Spacer()
//            Text(userAuth.givenName)
//            GoogleSignInButton(action:userAuth.signIn)
//            Button{
//                userAuth.signOut()
//            } label: {
//                Text("Sign Out")
//            }
//        }
//        .padding(24)
//        .frame(width: UIScreen.main.bounds.width)
        
        
        
        
        NavigationView{
            MyTabView()
        }
    }
    
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserAuthModel())
        
    }
}
