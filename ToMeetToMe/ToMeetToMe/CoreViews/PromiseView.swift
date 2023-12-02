//
//  PromiseView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/10.
//

import SwiftUI

struct PromiseView: View {
    var body: some View {
        
            
        NavigationView {
            ZStack{
                VStack() {
                    Spacer()
                    Text("아직 그룹이 없어요ㅠㅠ\n친구들과 그룹을 만들어보세요!\n ex) 건축학개론 팀플, 동창회")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    Spacer()
                }

                VStack {
                    Spacer()
                    NavigationLink(destination:AddGroupView()){
                        ZStack {
                            MainButtonView(buttonTitle: "그룹 생성하기")
                        }
                        .padding(.bottom, 50)
                    }


                }
                //PromiseConfirmationView()
//                .tint(Color.lightGray)
//                    .padding(.top, 4)
//                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            Text("그룹")
//                                .font(.system(size: 20))
//                                .fontWeight(.regular)
//                        }
//                    }
//                    .navigationBarItems(trailing: Button(action: {print("click")}, label: {Image("ellipsis")})
//                    )
            }
            //            GroupListView()
        }
    }
}

struct PromiseView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseView()
    }
}
