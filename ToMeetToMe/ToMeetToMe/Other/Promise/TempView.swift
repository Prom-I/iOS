//
//  TempView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/11/26.
//

import SwiftUI
import PopupView

struct TempView: View {
    
    var groupName:String
    var members: [Friend]
    @State var showingPopup = false
    
    init(members: [Friend], groupName: String) {
        self.members = members
        self.groupName = groupName
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    showingPopup = true
                }) {
                    
                    ZStack {
                        Rectangle()
                            .frame(width:345,height: 118)
                            .cornerRadius(10.0)
                            .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2) // 그림자 효과 설정
                        VStack(spacing: 10){
                            HStack {
                                Spacer().frame(width:50)
                                Text("추천 1")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            
                            HStack {
                                Spacer().frame(width:50)
                                Text("08/28 (월) 9:30")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                    }
                }
                .tint(.white)
            }
        }
        .popup(isPresented: $showingPopup){
            RecommendView(recommandNum: 1, availableFriends: members, unavailableFriends: members, showingPopup:$showingPopup)
        } customize: {
            $0.type (.default)
                .dragToDismiss(false)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(groupName)
                    .font(.system(size: 20))
                    .fontWeight(.regular)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(btnColor: .black))

    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView(members: [Friend(profileImageString: "1", nickname: "유진")], groupName: "프로미 팀")
            .previewLayout(.fixed(width: 70, height: 90))
    }
}
