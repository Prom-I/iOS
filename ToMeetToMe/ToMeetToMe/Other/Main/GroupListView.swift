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
                    .onTapGesture {
                        // GroupCard를 탭하면 원하는 동작 수행
                        print("tap")
                    }
                }
                .listStyle(.plain)
                MainButtonView(buttonTitle: "그룹 생성")
                    .padding(.bottom, 30)
                
            }
            .navigationTitle("그룹")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Image(systemName: "ellipsis"))
        }
    }
    
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView()
    }
}
