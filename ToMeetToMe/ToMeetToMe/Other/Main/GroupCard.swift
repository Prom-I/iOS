//
//  GroupCard.swift
//  ToMeetToMe
//
//  Created by 이자민 on 2023/10/12.
//

import SwiftUI

struct GroupCard : View{
    var groupProfileImg : String
    var groupTitle : String
    var meberNumber : String
    var bgColor : Color
    
    var body: some View{
        HStack(spacing: 16){
            Image(groupProfileImg)
                .resizable()
                .frame(width:48, height: 48)
                .cornerRadius(10)
                
                .foregroundColor(Color.gray)
            HStack(spacing: 10){
                Text(groupTitle)
                    .font(.system(size: 16))
                Text(meberNumber)
                    .font(.system(size: 12))
                    .foregroundColor(Color.mint)
            }
            VStack(spacing:0){
                Divider().opacity(0)

            }
            
        }
        .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24))
        .background(bgColor)
    }
    
}

struct GroupCard_Previews: PreviewProvider {
    static var previews: some View {
        GroupCard(groupProfileImg: "1", groupTitle: "groupTitle", meberNumber: "5",bgColor: Color.gray)
    }
}
