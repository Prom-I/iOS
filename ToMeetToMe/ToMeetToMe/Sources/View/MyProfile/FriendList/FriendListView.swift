//
//  FriendListView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/22.
//


import SwiftUI
import PopupView

struct FriendListView: View {
    
    @State private var searchText = ""
    @State var array = Friend.frinedArray
    @State var showingPopup = false
    @State var deleteTargetIdx = 0
    
    func createPopUpView() -> some View {
        ZStack {
            Color.black.opacity(0.5)
                   .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Spacer().frame(height:15)
                Text("알림")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                Spacer()
                Text("\(array[deleteTargetIdx].nickname) 님을 정말 삭제하시겠습니까?")
                Spacer()
                Divider().frame(width:300)
                HStack(spacing:0){
                    Button(action: {
                        array.remove(at: deleteTargetIdx)
                        self.showingPopup = false
    
                    }) {
                        Text("삭제")
                            .font(.system(size: 15))
                            .foregroundColor(.red)
                            .fontWeight(.regular)
                    }
                    .frame(width: 150, height: 40)
                    .background(Color.white)
                    Divider().frame(height:40)
                    Button(action: {
                        self.showingPopup = false
                    }) {
                        Text("아니요")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                    }
                    .frame(width: 150, height: 40)
                    .background(Color.white)
                }
            }
            .padding(.horizontal, 10)
            .frame(width: 300, height: 180)
            .background(.white)
            .cornerRadius(10.0)
            .offset(y: -50)
        } .onTapGesture {}
    }
    
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                VStack{
                    SearchBar(text: $searchText)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    
                    Header(text:"친구 목록 \(array.count)")
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    
                    List {
                        ForEach(Array(array.enumerated()), id: \.element.id) { index, friend in
                                                    FriendListCell(user: friend)
                                                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                                            Button(action: {
                                                                // 쓰레기통 버튼 동작 추가
                                                                print("Delete friend tapped for \(index)")
                                                                    showingPopup = true
                                                                    deleteTargetIdx = index
                                                            }) {
                                                                Image(systemName: "trash")
                                                                    .foregroundColor(Color.white)
                                                                    .font(.title)
                                                            }
                                                            .tint(Color.redColor)
                                                        }
                                                        .listRowInsets(EdgeInsets())
                                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                                        
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
            .popup(isPresented: $showingPopup){
                createPopUpView()
            } customize: {
                $0.type (.default)
                    .dragToDismiss(false)
            }
        }
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


struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}





