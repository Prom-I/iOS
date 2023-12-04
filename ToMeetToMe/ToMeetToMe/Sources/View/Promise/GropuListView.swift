//
//  GroupListView.swift
//  ToMeetToMe
//
//  Created by 이자민 on 2023/10/11.
//

import SwiftUI
import UIKit

struct GroupListView: View {
    var body: some View {
        
        NavigationView{
            ZStack(alignment: .bottom){
                
                List {
                    ForEach(1..<7, id: \.self) { index in
                        GroupCard(groupProfileImg: "\(index)", groupTitle: "Group \(index)", meberNumber: "\(index)", bgColor: Color.white)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true)
                        {
                            Button(action: {
                                // 쓰레기통 버튼 동작 추가
                                print("Delete button tapped for Group \(index)")
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(Color.white) // 쓰레기통 이미지의 색상 -> 왜 안먹지?
                                    .font(.title) // 이미지 크기 조절
                            }
                            .tint(Color.redColor)
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .onTapGesture {
                        // GroupCard를 탭하면 원하는 동작 수행
                        print("tap")
                    }
                }
                .listStyle(.plain)
                NavigationLink(destination:AddGroupView()){
                    MainButtonView(buttonTitle: "그룹 생성")
                        .padding(.bottom, 30)
                }
            }
            .navigationTitle("그룹")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Image(systemName: "ellipsis"))
        }
    }
    
}

private struct GroupCard: View {
    var groupProfileImg : String
    var groupTitle : String
    var meberNumber : String
    var bgColor : Color
    
    fileprivate init(groupProfileImg: String, groupTitle: String, meberNumber: String, bgColor: Color) {
        self.groupProfileImg = groupProfileImg
        self.groupTitle = groupTitle
        self.meberNumber = meberNumber
        self.bgColor = bgColor
    }
    
    fileprivate var body: some View{
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


struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView()
    }
}

