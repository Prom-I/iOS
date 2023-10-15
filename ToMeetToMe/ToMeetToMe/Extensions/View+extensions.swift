//
//  View+extensions.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/11.
//

import SwiftUI

// View의 Size를 측정하는 뷰 모디파이어
extension View {
    @ViewBuilder // View의 크기를 읽어서 외부로 전달한다. 인자로 주어진 클로저에 크기 정보를 전달해준다.
    func onReadSize(_ perform: @escaping (CGSize) ->Void) -> some View {
        self.customBackground {
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        }
        .onPreferenceChange(SizePreferenceKey.self, perform: perform)
    }
    
    // 단순히 SwiftUI의 background 메서드와 같은 역할
    @ViewBuilder
    func customBackground<V: View> (alignment: Alignment = .center, @ViewBuilder content:() -> V) -> some View {
        self.background(alignment: alignment, content: content)
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero // 키에 대응되는 값으로 CGSize를 가진다.
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
// PreferenceKey를 따랐기 때문에 뷰 계층 내에서 값을 공유할 수 있게 된다.
