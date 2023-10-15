//
//  ContentView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            MyTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
