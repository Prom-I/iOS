//
//  MainButtonView.swift
//  ToMeetToMe
//
//  Created by 이자민 on 2023/10/22.
//

import SwiftUI

struct MainButtonView : View{
    var buttonTitle : String
    var body: some View{
        Text(buttonTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 16, leading: 48, bottom: 16, trailing: 48))
            .background(Color.primaryColor)
            .cornerRadius(25)
            .shadow(color: .black.opacity(0.1), radius: 5.5, x: 0, y: 4)
    }

    
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView(buttonTitle: "Button Title")
    }
}


