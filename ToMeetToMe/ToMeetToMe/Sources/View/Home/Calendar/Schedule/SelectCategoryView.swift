//
//  SelectCategoryView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 1/29/24.
//

import SwiftUI

struct SelectCategoryView: View {
    let colors: [Color] = [
        Color("pink1"),
        Color("pink2"),
        Color("skyBlue"),
        Color("yellow"),
        Color("yellowGreen"),
        Color("indigoBlue"),
        Color("indigoPurple"),
        Color("lightPurple"),
        Color("gray2"),
        Color("orange")
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HeaderView()
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)){
                    ForEach(Array(colors), id: \.self) { color in
                        CategoryItem(color: color)
                    }
                }
                .padding(.top, 14)
                .padding(.horizontal, 24)
                .padding(.bottom, 34)
            }
        }
        .presentationDetents([
                            .fraction(0.7), // 임의 비율
                            .medium, // 중간 높이
                            ])
        .presentationCornerRadius(30)
        .presentationDragIndicator(.visible) // DragIndicatior 활성화
        .interactiveDismissDisabled() // 인터랙션 비활성화
    }
}

private struct HeaderView: View {
    fileprivate var body: some View {
        HStack {
            Text("카테고리 선택")
            Spacer()
            Button(action: {}, label: {
                Text("편집")
            })
            .foregroundStyle(.red)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 24)
    }
}

private struct CategoryItem: View {
    var color: Color
    
    fileprivate var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            
            Text("카테고리 1")
                .foregroundStyle(color)
            Spacer()
        }
        .padding(16)
        .background(Color("lightGray"))
        .cornerRadius(8, corners: .allCorners)
        .frame(width: (UIScreen.main.bounds.width - 56) / 2, height: 52)
    }
}

#Preview {
    SelectCategoryView()
}
