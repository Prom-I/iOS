//
//  AddFriendView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/11.
//

import SwiftUI

struct AddFriendView: View {
    
    @State private var searchText = ""
    @State var array = Friend.frinedArray
    
    var body: some View {
        GeometryReader { geometry in // GeometryReader를 사용하여 화면 크기를 얻음
            VStack{
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
//                List {
//                    ForEach(array.filter { friend in
//                        !(searchText.isEmpty) && friend.nickname.localizedCaseInsensitiveContains(searchText)
//                    }) { friend in
//                        AddFriendListCell(user: friend)
//                    }
//
//                } //리스트의 스타일 수정
//                .listStyle(PlainListStyle())
                
                
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading, spacing: 15) {
                        ForEach(array.filter { friend in
                            !(searchText.isEmpty) && friend.nickname.localizedCaseInsensitiveContains(searchText)
                        }) { friend in
                            AddFriendListCell(user: friend)
                        }
                    }
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                
                
            }
            .frame(width: geometry.size.width, // 화면의 너비만큼 설정
                   height: geometry.size.height)
            .navigationBarTitle("친구 추가", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("친구 추가")
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
            
        }
        
    }
    
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView()
    }
}


