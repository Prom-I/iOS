//
//  CardView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/22.
//

import SwiftUI

struct CardView: View {
    
    var width:CGFloat
    var height:CGFloat
    var icon:String
    var mainText:String
    var subText:String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(mainText)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text(subText)
            }
            Image(systemName: icon)
                .padding(.leading,40)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
             .stroke(Color.gray, lineWidth: 1)
             .frame(width:width,height:height)
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(width:150,height:60, icon:"person.2.fill",
        mainText: "친구목록",
        subText: "4")
    }
}



