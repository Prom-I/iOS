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
                VStack(alignment: .leading, spacing: 40){
                    Text("08월 23일 (수)")
                        .font(.title2)
                    VStack {
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
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.mintColor)
                            .frame(width: 164, height: 50)
                            .overlay(Text("일정 추가").foregroundColor(Color.white).bold())
                            .shadow(color: .black.opacity(0.1), radius: 5.5, x: 0, y: 4)
                    }
                }
                .padding(.bottom, 40)
               
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
