//
//  AddScheduleVIew.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import SwiftUI

struct AddScheduleView: View {
    @State var name: String = ""
    @State var category: String = "회의"
    var categories = ["회의", "스터디", "근로", "강의"]
    @State var startDate = Date()
    @State var endDate = Date()
    @State var memo: String = ""
    
    var body: some View {
        
        VStack {
        
            VStack {

                HStack {
                    Text("11월 18일 (토)")
                        .font(.title2)
                    Spacer()
                    Button(action: {print("클릭")}) {
                        Text("확인")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 26)
                
                List {
                    Section {
                        TextField("일정을 입력해주세요.", text: $name)
                            .padding(.vertical, 8)
                        
                        Picker("카테고리", selection: $category) {
                            ForEach(categories, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.vertical, 4)
                        .accentColor(.gray)
                    }
                    Section{
                        DatePicker(
                            "시작",
                            selection: $startDate,
                            displayedComponents: [.date, .hourAndMinute]
                        )
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        DatePicker(
                            "종료",
                            selection: $startDate,
                            displayedComponents: [.date, .hourAndMinute]
                        )
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                    }
                    
                    Section {
                        TextField("메모를 입력해주세요.", text: $memo, axis: .vertical)
                            .frame(height: 100)
                            .lineLimit(3, reservesSpace: true)
                    }
                    
                }
                .padding(.horizontal, 10)
                .listRowBackground(Color.clear)
                .scrollContentBackground(.hidden)
              
            }
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.68)
            .background(Color.lightGray)

        }
    }
}

struct AddScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        AddScheduleView()
    }
}
