//
//  SettingGroupView.swift
//  ToMeetToMe
//
//  Created by 이자민 on 2023/10/15.
//

import SwiftUI

struct SettingGroupView: View {
    @State private var inputGroupName:String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment:.bottomTrailing){
                    Image("1")
                        .resizable()
                        .frame(width:104, height: 104)
                        .cornerRadius(15)
                    Circle()
                        .frame(width:24, height: 24)
                        .foregroundColor(Color.gray)
                        .overlay(
                            Image(systemName: "camera")
                                .font(.system(size: 12))
                                .foregroundColor(Color.white)
                        )
                        .offset(x: 5, y: 5)
                }
                .padding(.top, 50)
                
                TextField("그룹이름은 무엇으로 할까요?",text: $inputGroupName)
                    .padding(.top, 50)
                    //.padding(.leading, 24)
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 345, height: 1)
                  .background(.black)
                
                Text("ex) 건축학개론 팀플 / 프로미초 34기 졸업생")
                    .font(Font.custom("Pretendard", size: 12))
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .leading) // 좌측 정렬
                    //.padding(.leading, 24)
                    
                Spacer()
                
            }
            .padding(.horizontal, 24)
            .navigationTitle("그룹 설정")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Text("확인"))       //Toolbar로 바꿔야함
            
        }
        
    }
}

struct SettingGroupView_Previews: PreviewProvider {
    static var previews: some View {
        SettingGroupView()
    }
}

