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
                
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading, spacing: 15) {
                        ForEach(array.filter { friend in
                            searchText.isEmpty || friend.nickname.localizedCaseInsensitiveContains(searchText)
                        }) { friend in
                            FriendListCell(user: friend)
                        }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
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





