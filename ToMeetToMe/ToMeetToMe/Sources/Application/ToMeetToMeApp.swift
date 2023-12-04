//
//  ToMeetToMeApp.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/09.
//

import SwiftUI

@main
struct ToMeetToMeApp: App {
    @StateObject var userAuth: UserAuthModel = UserAuthModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userAuth)
        }
    }
}
