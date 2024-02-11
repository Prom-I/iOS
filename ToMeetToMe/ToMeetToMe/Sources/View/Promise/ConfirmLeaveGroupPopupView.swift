//
//  ConfirmLeaveGroupPopupView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2/10/24.
//

import SwiftUI

struct ConfirmLeaveGroupPopupView: View {
    var body: some View {
        
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 0){
                    Spacer()
                        .frame(height: 10)
                    
                    Text("알림")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(height: 28)
                    Spacer()
                        .frame(height: 22)
                    
                    HStack(spacing: 0) {
                        Text("그룹")
                            .font(.system(size: 15, weight: .bold))
                        Text("을 정말 나가시겠습니까?")
                            .font(.system(size: 15))
                            .frame(height: 28)
                    }
                    Spacer()
                        .frame(height: 41)
                    
                    Divider()
                    
                    HStack(alignment: .center) {
                        Button(action: {}) {
                            Spacer()
                            Text("삭제")
                                .foregroundStyle(Color.redColor)
                            Spacer()
                        }
                        
                        Divider()
    
                        Button(action: {}) {
                            Spacer()
                            Text("취소")
                                .foregroundStyle(.black)
                            Spacer()
                        }
                    }
                    .font(.system(size: 15, weight: .regular))
                  
                }
            }
        
                    
        }
        .background(Color.white)
        .cornerRadius(8)
        .frame(width: UIScreen.main.bounds.width - 104, height: 178)
        .background(Color.clear)
        .shadow(color: Color.black.opacity(0.1), radius: 11, x: 0, y: 4)
            
    }
}


#Preview {
    ConfirmLeaveGroupPopupView()
}
