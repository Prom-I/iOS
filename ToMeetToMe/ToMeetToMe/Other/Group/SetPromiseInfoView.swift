//
//  PromiseInfoView.swift
//  ToMeetToMe
//
//  Created by 이자민 on 2023/11/26.
//

import SwiftUI

struct SetPromiseInfoView: View {
    @State private var promiseTime: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("약속 소요시간을 \n선택해주세요 :)")
                .padding(.top, 33)
            
            HStack() {
                TextField(
                    "",
                    text: $promiseTime
                    
                )
                .padding()
                .frame(width: 112)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.mint, lineWidth: 1)
                )
                
                Text("시간")
                
                Spacer()
            }
            
            Text("선호 요일을 \n선택해주세요 :)")
                .padding(.top, 52)
            
            HStack() {
                Button(action: {
                    print("평일 선택")
                }, label: {
                    Text("평일")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 23, leading: 40, bottom: 23, trailing: 40))
                        .background(Color.lightGray)
                        .cornerRadius(8)
    
                })
                
                Button(action: {
                    print("평일 선택")
                }, label: {
                    Text("주말")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 23, leading: 40, bottom: 23, trailing: 40))
                        .background(Color.primaryColor)
                        .cornerRadius(8)
    
                })
            
                Button(action: {
                    print("평일 선택")
                }, label: {
                    Text("선택")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .cornerRadius(8)
                        .padding(EdgeInsets(top: 23, leading: 40, bottom: 23, trailing: 40))
                        
                        .background(Color.white)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 2)
                            )
                        
                        
                            
    
                })
                .cornerRadius(8)
                
                

                
                


            }
            
            Text("약속 장소를\n적어주세요 :)")
                .padding(.top, 52)

            TextField(
                "",
                text: $promiseTime
                
            )
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
            Spacer()
        }
        .padding(.horizontal, 24)
        
    }
    
}


struct SetPromiseInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SetPromiseInfoView()
    }
}
