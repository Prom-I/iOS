//
//  CalendarViewModel.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/11/12.
//

import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var schedules: [Schedule]
    
    init(
        schedules: [Schedule] = [
        Schedule(name: "종강", startAt: "2023-12-17T19:11:00", endAt: "2023-12-17T19:11:00", allDay: true, memo: "오늘 저녁은 고기!", notification: true, repeatString: "repeat process", complete: false),
        Schedule(name: "hi", startAt: "2023-12-22T19:11:00", endAt: "2023-12-22T19:11:00", allDay: true, memo: "오늘은 뭐먹지?", notification: true, repeatString: "repeat process", complete: false),
        Schedule(name: "뭐함", startAt: "2023-12-27T19:11:00", endAt: "2023-12-27T19:11:00", allDay: true, memo: "오늘 저녁은 고기!", notification: true, repeatString: "repeat process", complete: false),
        Schedule(name: "어렵다", startAt: "2023-12-04T19:11:00", endAt: "2023-12-04T19:11:00", allDay: true, memo: "오늘 저녁은 고기!", notification: true, repeatString: "repeat process", complete: false)
        ]
    ) {
        self.schedules = schedules
    }
   

    
}

