//
//  SideMenuView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2/11/24.
//

import SwiftUI

struct SideMenuView: View {
    @State private var showMenu: Bool = false
    
    var body: some View {
        
            ZStack {
                Color.white.ignoresSafeArea(.all, edges: .all)
                NavigationView {
                    VStack {
                        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    }
                    .navigationTitle("Side Menu Test")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Button {
                            self.showMenu.toggle()
                        } label: {
                            Image("ic_three_dots")
                        }
                    }
                
                }
                
                
                GeometryReader { _ in
                    HStack {
                        Rectangle()
                            .fill()
                            .edgesIgnoringSafeArea(.bottom)
                        GroupParticipantListView(isShowing: true)
                            .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
                            .animation(.easeInOut(duration: 0.4), value: showMenu)
                    }
                }
                .background(Color.black.opacity(showMenu ? 0.3 : 0))
                .onTapGesture {
                    self.showMenu = false
                }
            
        }
        
    }
}

#Preview {
    SideMenuView()
}
