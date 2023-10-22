//
//  PromiseListView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import SwiftUI

struct PromiseListView: View {
    @State private var isAlarmViewActive = false
    var body: some View {
        GeometryReader { geometry in
            
            ZStack(alignment: .topLeading) {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible())], content: {
                        ForEach(1...1, id: \.self) { index in
                            PromiseScheduleView()
                        }
                    })
                    
                }
                .frame(height: geometry.size.height)
                .padding(20)
                
                Button(action: {print("클릭")}) {
                    NavigationLink(destination: Text("")){
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.mintColor)
                            .frame(width: 164, height: 50)
                            .overlay(Text("3초만에 약속 잡기").foregroundColor(Color.white).bold())
                            .shadow(color: .black.opacity(0.1), radius: 5.5, x: 0, y: 4)
                    }
                }
                .offset(x: geometry.size.width/2-82, y: geometry.size.height-70)
            }
            .navigationBarTitle("프로미팀", displayMode: .inline).font(.system(size: 17))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(), trailing: Button(action: {print("click")}){
                Image("ic_three_dots")
            })
            .frame(width: geometry.size.width, height: geometry.size.height)
            
               
         
           
            
        }
    }
}

struct PromiseScheduleView: View {
    
    
    var body: some View {
        GeometryReader { geometry in
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("2023.08.24 ~ 2023.08.28")
                        .font(.system(size: 11))
                    Text("2차 회의")
                        .font(.title3)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
                
            }
            .padding(EdgeInsets(top:18,leading:20,bottom:18,trailing:20))
            .background(.white)
            .overlay(
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray,lineWidth:1)
            )
            .frame(height: 80)
        }
    }
}

struct PromiseListView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseListView()
    }
}
