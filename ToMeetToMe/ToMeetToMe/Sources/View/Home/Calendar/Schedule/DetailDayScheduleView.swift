//
//  DetailDayScheduleView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import SwiftUI

struct DetailDayScheduleView: View {
    @Binding var shouldShowDetailSchedule: Bool
    @Binding var isShowAddScheduleView: Bool
    @Binding var isShowSelectCategoryView: Bool
    
//    init(shouldShowDetailSchedule: Bool = false, isShowAddScheduleView: Bool = false) {
////        self.shouldShowDetailSchedule = shouldShowDetailSchedule
////        self.isShowAddScheduleView = isShowAddScheduleView
//    }
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 50){
                    Text("11월 18일 (수)")
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
                
                Button(action: {
//                    shouldShowDetailSchedule = false
//                    isShowAddScheduleView = true
                    isShowSelectCategoryView = true
                }) {
                    MainButtonView(buttonTitle: "일정 추가")
                }
                .padding(.bottom, 30)
                
            }
            .padding(24)
                        
            }
            .background(Color.lightGray)
            .cornerRadius(15)
            .frame(width: UIScreen.main.bounds.width - 48, height: 550)
            .background(Color.clear)
            
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
    
//    struct DetailDayScheduleView_Previews: PreviewProvider {
//        static var previews: some View {
//            DetailDayScheduleView(shouldShowDetailSchedule: <#Binding<Bool>#>, isShowAddScheduleView: <#Binding<Bool>#>)
//        }
//    }

