//
//  CalendarViewModel.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/11/12.
//

import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var schedules: [Schedule]
    
    init(schedules: [Schedule] = [
        Schedule(name: "ㅠㅠㅠ", startAt: "2023-11-17T19:11:00", endAt: "2023-11-17T19:11:00", allDay: true, memo: "", notification: true, complete: false),
        Schedule(name: "hi", startAt: "2023-11-27T19:11:00", endAt: "2023-11-27T19:11:00", allDay: true, memo: "", notification: true, complete: false),
        Schedule(name: "뭐함", startAt: "2023-11-07T19:11:00", endAt: "2023-11-07T19:11:00", allDay: true, memo: "", notification: true, complete: false),
        Schedule(name: "어렵다", startAt: "2023-11-03T19:11:00", endAt: "2023-11-03T19:11:00", allDay: true, memo: "", notification: true, complete: false)
    ]) {
        self.schedules = schedules
    }
    
    
}

