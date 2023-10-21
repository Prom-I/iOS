//
//  PromiseView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/10.
//

import SwiftUI

struct PromiseView: View {
    var body: some View {
        ZStack{
            NavigationView {
                NavigationLink(destination:AddGroupView()){
                    ZStack {
                        Rectangle()
                            .frame(width: 60, height: 60)
                        
                        Text("+")
                            .font(Font.custom("Noto Sans", size: 20))
                            .foregroundColor(Color.mintColor)
                            .frame(width: 10.8, height: 24.3, alignment: .topLeading)
                    }
                    
                }.tint(Color.lightGray)
                    .padding(.top, 4)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("그룹")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                        }
                    }
                    .navigationBarItems(trailing: Button(action: {print("click")}, label: {Image("ic_bell")})
                    )
            }
        }
    }
}

struct PromiseView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseView()
    }
}
