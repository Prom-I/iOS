//
//  AddMemberListCell.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/15.
//

import SwiftUI

struct AddMemberListCell: View {
    
    var user: Friend
    @State var isChecked: Bool = false
    let pub = NotificationCenter.default.publisher(for: NSNotification.Name("btnStateChange"))
    
    // 생성자를 수정하여 @Binding 프로퍼티를 초기화합니다.
    init(user: Friend) {
        self.user = user
    }
    
    var body : some View {
 
        HStack {

            Image(self.user.profileImageString)
                .resizable()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 1))
                .foregroundColor(.gray)
                .padding(.trailing,10)
            VStack(alignment:.leading){
                Text(self.user.nickname)
                    .font(.system(size: 15))
                Text("#\(123/*self.user.id*/)")
                    .font(.system(size: 13))
            }
            Spacer()
            CheckBoxButton(isChecked: $isChecked)
        }
        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7))
        .onChange(of: isChecked) { newValue in
            // isChecked 값이 변경될 때 호출되는 클로저
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "editMemberList"), object: nil, userInfo: ["member": user])
        }
    }
}

//struct AddMemberListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        let friend = Friend(profileImageString: "1", nickname: "유진")
//        let groupMemberList: [Friend] = [] // 초기화할 데이터로 빈 배열을 사용하거나 다른 데이터로 초기화하세요.
//
//        return AddMemberListCell(user: friend, groupMemberList:.constant(groupMemberList))
//    }
//}


