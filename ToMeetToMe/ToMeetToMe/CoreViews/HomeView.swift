//
//  HomeView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/10.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack{
            NavigationView {
                MainView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: Text("To Meet To Me").font(.title).bold().foregroundColor(Color.mintColor), trailing: Button(action: {print("click")}, label: {Image("ic_bell")})
                    )
            }
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
