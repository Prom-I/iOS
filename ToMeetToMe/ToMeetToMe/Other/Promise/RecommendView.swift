//
//  RecommendView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/11/26.
//


import SwiftUI

struct RecommendView: View {
    
    var recommandNum:Int
    var availableFriends:[Friend]
    var unavailableFriends:[Friend]
    @Binding var showingPopup:Bool
    
    init(recommandNum: Int, availableFriends: [Friend], unavailableFriends:[Friend], showingPopup: Binding<Bool> ) {
        self.recommandNum = recommandNum
        self.availableFriends = availableFriends
        self.unavailableFriends = unavailableFriends
        _showingPopup = showingPopup
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("추천 \(recommandNum)")
                        .font(.system(size:15))
                        .fontWeight(.regular)
                    Spacer()
                    Button(action: {
                        self.showingPopup = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(Font.system(size: 16).weight(.medium))
                    }
                    Spacer().frame(width:15)
                }
                
                Spacer().frame(height:35)
                
                HStack {
                    Spacer().frame(width:25)
                    MeetingInfoView(meetingDate: "08/28 (월)", meetingTime: "09:30", totalMember: unavailableFriends.count + availableFriends.count, availableMember: availableFriends.count)
                   Spacer()
                }
                
                Spacer().frame(height:20)
                
                MeetingMemberView(availableFriends:availableFriends, unavailableFriends :unavailableFriends)
                
                Spacer().frame(height:64)
                
                Divider().frame(width:300)
                
                Spacer().frame(height: 16)
                
                Button(action: {
                    self.showingPopup = false
                }) {
                    Text("약속 확정하기")
                        .font(.system(size:15))
                        .fontWeight(.bold)
                        .foregroundColor(.mintColor)
                }
                
                
            }
        }
        .frame(width: 340, height: 506)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 0)
        .onTapGesture { }
    }
}







