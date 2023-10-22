//
//  HomeView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/10.
//

import SwiftUI

struct HomeView: View {
    @State private var isAlarmViewActive = false
    var body: some View {
        ZStack{
            
            MainView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Text("To Meet To Me").font(.title).bold().foregroundColor(Color.mintColor),
                                    trailing: NavigationLink(destination: AlarmView(), isActive: $isAlarmViewActive) {
                    Button(action: {isAlarmViewActive = true},              label: {Image("ic_bell")})
                    
                })
        
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
