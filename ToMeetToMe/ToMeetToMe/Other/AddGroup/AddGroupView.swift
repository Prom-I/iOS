//
//  AddGroupView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/11.
//

import SwiftUI

struct AddGroupView: View {
    
    @State private var searchText = ""
    @State var array = Friend.frinedArray
    @State var groupMemberList:[Friend] = []
    
    let pub = NotificationCenter.default.publisher(for: NSNotification.Name("editMemberList"))
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack{
                if (!groupMemberList.isEmpty) {
                    AddMemberGrideView(groupMemberList: $groupMemberList)
                }

                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))

                
                Header(text:"친구 목록 \(array.count)")
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading, spacing: 15) {
                        ForEach(array.filter { friend in
                            searchText.isEmpty || friend.nickname.localizedCaseInsensitiveContains(searchText)
                        }) { friend in                            
                            AddMemberListCell(user: friend)
                        }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
            }
            .frame(width: geometry.size.width, // 화면의 너비만큼 설정
                   height: geometry.size.height)
            .navigationBarTitle("그룹 생성하기", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("그룹 생성하기")
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CancleButton(),trailing: Button(action: {
            }) {
//<<<<<<< Updated upstream
//                Text("확인")
//                    .fontWeight(.regular)
//=======
                if (!groupMemberList.isEmpty) {
                    Text("\(groupMemberList.count)")
                        .fontWeight(.regular)
                        .foregroundColor(.mintColor)
                }

                NavigationLink(destination:TempView(members: groupMemberList, groupName: "프로미 팀")){
                    Text("확인")
                        .fontWeight(.regular)
                        .foregroundColor(groupMemberList.isEmpty ? Color.gray : Color.black)
                }
                .disabled(groupMemberList.isEmpty)


//>>>>>>> Stashed changes
            }.foregroundColor(Color.black))
            
        }.onReceive(pub) { (notification) in
            if let member = notification.userInfo?["member"] as? Friend {
                withAnimation {
                    self.editMemberList(member:member)
                }
            }
        }
        
    }
    
    func editMemberList(member: Friend) {
        if groupMemberList.contains(where: { $0.id == member.id }) { // friendList에 포함되어 있는 상태
            groupMemberList.removeAll { $0.id == member.id }
        } else {  // 포함되어 있지 않은 상태
            groupMemberList.append(member)
        }
        groupMemberList.sort()
    }
}

struct Header: View {
    
    var headerText:String
    init(text: String) {
        self.headerText = text
    }
    
    var body: some View {
        Text(headerText)
        .font(.system(size: 16))
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .frame(height: 10)
        .padding(.leading, 10)
        .background(Color.white)
    }
}




