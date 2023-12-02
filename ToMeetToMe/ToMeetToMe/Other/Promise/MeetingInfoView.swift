//
//  MeetingInfoView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/11/26.
//

import SwiftUI

struct MeetingInfoView: View {
    
    var meetingDate:String
    var meetingTime:String
    var totalMember:Int
    var availableMember:Int
    
    init(meetingDate: String, meetingTime: String, totalMember:Int, availableMember: Int ) {
        self.meetingDate = meetingDate
        self.meetingTime = meetingTime
        self.totalMember = totalMember
        self.availableMember = availableMember
    }
    
    var body: some View {
        VStack(spacing:12){
            HStack{
                Text("날짜:")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                
                Text(meetingDate)
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                Text("시간:")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                
                Text(meetingTime)
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                Text("인원:")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                
                Text("\(totalMember)명 중")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                
                Text("\(availableMember)명")
                    .font(.system(size: 15))
                    .foregroundColor(.mintColor)
                    .fontWeight(.bold)
                
                Text("가능")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                Spacer()
            }
            
        }
    }
}

