//
//  DetailDayScheduleView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import SwiftUI

struct DetailDayScheduleView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 50){
                 
                    Text("08월 23일 (수)")
                        .font(.title2)
                    
                    VStack(spacing: 20) {
                        scheduleView()
                        scheduleView()
                        scheduleView()
                    }
                    
                    Spacer()
                    Divider()
                        .opacity(0)
                }
                .padding(24)
                    
                
                Button(action: {print("클릭")}) {
                    NavigationLink(destination: Text("")){
                        MainButtonView(buttonTitle: "일정 추가")
                    }
                }
                .padding(.bottom, 30)
               
            }
            .frame(width: geometry.size.width-48, height: 550)
            .background(Color.lightGray)
            .cornerRadius(15)
            
        }
        
    }
}

struct scheduleView: View {
    @State
    var isCompleted: Bool
    var imageName: String {
        if(isCompleted) {
            return "ic_blue_checked"
        } else {
            return "ic_blue_unchecked"
        }
    }
    
    init(isCompleted: Bool = false) {
        self.isCompleted = isCompleted
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {isCompleted.toggle()}) {
                withAnimation{
                    Image(imageName)
                }
            }
            
            VStack(alignment: .leading, spacing: 4){
                Text("프로미 1차 회의")
                    .font(.system(size: 18))
                Text("10:00 AM • 11:00 AM")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    
            }
        }
    }
}

struct DetailDayScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDayScheduleView()
    }
}
