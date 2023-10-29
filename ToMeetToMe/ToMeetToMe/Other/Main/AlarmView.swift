//
//  AlamView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/15.
//

import SwiftUI

struct AlarmView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())], alignment: .leading) {
                MessageView(content: "이자민님이 친구 신청을 보냈습니다.", time: "1분전")
                MessageView(content: "이자민님이 친구 신청을 보냈습니다.", time: "1분전")
                MessageView(content: "이자민님이 친구 신청을 보냈습니다.", time: "1분전")
                MessageView(content: "이자민님이 친구 신청을 보냈습니다.", time: "1분전")
            }
        }
        .navigationBarTitle("알림", displayMode: .inline).font(.system(size: 17))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                       self.presentationMode.wrappedValue.dismiss() // 눌렀을 때 : pop view
                   }) {
                       Image(systemName: "chevron.left")
                           .accentColor(.black) //
                   })
    }
}

struct MessageView: View {
    let content: String
    let time: String
    
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.lightGray)
                .frame(width: 54, height: 54)
            Spacer(minLength: 10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(content)
                Text(time)
                    .font(.system(size: 12))
            }
            Spacer(minLength: 8)
            
       
            Button(action: {print("Click")}) {
//                ZStack{
//
//
//                    Text("확인")
//                        .font(.system(size: 14)).bold()
//                        .foregroundColor(Color.white)
//                }
//
                RoundedRectangle(cornerSize: .init(width: 4, height: 4))
                    .frame(width: 70, height: 34)
                    .foregroundColor(Color.mintColor)
                    .overlay(Text("확인")
                        .font(.system(size: 14)).bold()
                        .foregroundColor(Color.white))
            }
            
            
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

struct AlamView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
