//
//  SearchBar.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/11.
//

import SwiftUI

struct SearchBar: View {
    
    @State  private var isActivated:Bool = false
    @FocusState private var isFocused: Bool
    @Binding var text: String
    
    var body: some View {
        HStack(spacing:15){
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("검색", text: $text)
                    .keyboardType(.default)
                    .foregroundColor(.primary)
                    .onTapGesture {
                        withAnimation{
                            self.isActivated = true
                            isFocused = true // 텍스트뷰에 포커스 주기
                        }
                    }
                    .focused($isFocused)
                
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
                else {
                    EmptyView()
                }
            }
            .frame(height: 30) // 높이 설정
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
            
            if (isActivated) {
                Button(action: {
                    self.text = ""
                    withAnimation {
                        self.isActivated = false
                        // 텍스트 필드의 포커스를 해제
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }) {
                    Text("취소")
                        .fontWeight(.regular)
                }.foregroundColor(Color.black)
            }
        }
        .padding(.horizontal,20)
    }
}

