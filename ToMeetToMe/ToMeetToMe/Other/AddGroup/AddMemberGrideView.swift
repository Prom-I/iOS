//
//  AddMemberGrideView.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/15.
//

import SwiftUI


struct AddMemberGrideView: View {
    @Binding var groupMemberList:[Friend]
    
    var body: some View {
        // 스크롤뷰로 감싸서 스크롤 가능하도록 설정
        HStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {   // 가로 스크롤
                LazyHGrid(rows: [GridItem(.flexible())], content: { // 정렬 해야함
                    ForEach(groupMemberList, content: { (member: Friend) in
                        AddMemberView(member: member)
                    })
                })
                .frame(height: 84)
            }
    
        }.padding(12)
          
    }
}

//struct AddMemberGrideView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMemberGrideView()
//            .previewLayout(.fixed(width: 434, height: 100))
//    }
//}
