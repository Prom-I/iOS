//
//  ProfileView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/10.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            NavigationView {
                MyPageView()
                    .navigationBarItems(trailing: HStack {
                        Button(action: {print("click")}, label: {Image(systemName:"gearshape")                  .foregroundColor(.black)})
                        
                        Button(action: {print("click")}, label: {Image("ic_bell")})
                        }
                    )
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
