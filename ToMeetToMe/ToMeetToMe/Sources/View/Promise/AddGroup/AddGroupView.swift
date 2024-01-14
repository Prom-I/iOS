//
//  AddGroupView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/11.
//

import SwiftUI
import Moya

// MARK: - 그룹 생성 화면
struct AddGroupView: View {
    
    @State private var searchText = ""
    @State var array = Friend.frinedArray
    @State var users:[Friend] = []
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
                    .onChange(of: searchText, perform: { newText in
                        users.removeAll()
                        if (!searchText.isEmpty && searchText.count >= 2) {
                            loadSearchUsers(nickName: newText)
                        }
                    })
                
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading, spacing: 15) {
                        ForEach(array.filter { friend in
                            searchText.isEmpty || friend.nickname.localizedCaseInsensitiveContains(searchText)
                        }) { friend in                            
                            AddMemberListCell(user: friend)
                        }
                    }
                    
                    LazyVStack(alignment: .leading, spacing: 15) {
                        ForEach(users.filter { user in
                            searchText.isEmpty || user.nickname.localizedCaseInsensitiveContains(searchText)
                        }) { user in
                            AddMemberListCell(user: user)
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
    
    func loadSearchUsers(nickName: String) {
        let provider = MoyaProvider<ToMeetToMeAPI>()
        provider.request(.userByNickname(nickName)) { result in
            switch result {
                case let .success(response):
                guard var result = try? response.map([Friend].self) else {
                    return
                }
                
                print("result:\(result)")
                result.sort()
                
                users = result
                    
                case let .failure(error):
                    print("통신 실패: \(error.localizedDescription)")
            }
        }
    }
}





