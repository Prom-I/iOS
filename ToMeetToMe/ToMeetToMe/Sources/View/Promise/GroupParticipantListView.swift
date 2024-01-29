//
//  GroupParticipantListView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 1/29/24.
//

import SwiftUI

struct GroupParticipantListView: View {
    @State var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if (isShowing) {
                Color.black
                    .opacity(0.2)
                    .onTapGesture {
                        isShowing.toggle()
                    }
                SiceMenuView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                .animation(.easeInOut, value: isShowing)
    }
}

private struct SiceMenuView: View {
    fileprivate var body: some View {
        HStack {
            ZStack {
                Spacer()
                Rectangle()
                    .fill(.white)
                    .frame(width: 280)
                
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 80)
                    TitleView()
                    
                    Spacer()
                }
                
                
            }
        }
    }
}

private struct TitleView: View {
    fileprivate var body: some View {
        Text("그룹 참여자 명단")
            .font(.system(size: 16, weight: .bold))
        
    }
}


#Preview {
    GroupParticipantListView(isShowing: true)
}
