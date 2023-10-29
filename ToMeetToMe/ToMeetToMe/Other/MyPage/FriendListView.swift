//
//  FriendListView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/22.
//


import SwiftUI

struct FriendListView: View {
    
    @State private var searchText = ""
    @State var array = Friend.frinedArray
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack{
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                Header(text:"친구 목록 \(array.count)")
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                
                List {
                    ForEach(array.filter { friend in
                        searchText.isEmpty || friend.nickname.localizedCaseInsensitiveContains(searchText)
                    }) { friend in
                        FriendListCell(user: friend)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true){
                                Button(action: {
                                    // 쓰레기통 버튼 동작 추가
                                    print("Delete friend tapped for \(index)")
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(Color.white) // 쓰레기통 이미지의 색상 -> 왜 안먹지?
                                        .font(.title) // 이미지 크기 조절
                                }
                                .tint(Color.redColor)
                            }
                    }.listRowInsets(EdgeInsets())
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .onTapGesture {
                            // GroupCard를 탭하면 원하는 동작 수행
                            print("tap")
                        }
                    
                }
                .listStyle(.plain)
            }
            .frame(width: geometry.size.width, // 화면의 너비만큼 설정
                   height: geometry.size.height)
            .navigationBarTitle("친구 목록", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("친구 목록")
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(btnColor:.black),trailing: Button(action: {
            }) {
                Image(systemName: "plus")
            }.foregroundColor(Color.black))
            
        }
        
    }
    
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}





