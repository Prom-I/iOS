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
        Schedule(name: "12월 17일", 
                 startAt: "2023-12-17T19:11:00",
                 endAt: "2023-12-17T19:11:00",
                 allDay: true,
                 memo: "",
                 notification: true,
                 repeatString: "repeat process",
                 complete: false),
        Schedule(name: "12월 22일", 
                 startAt: "2023-12-22T19:11:00",
                 endAt: "2023-12-22T19:11:00",
                 allDay: true,
                 memo: "",
                 notification: true,
                 repeatString: "repeat process",
                 complete: false),
        Schedule(name: "12월 27일", 
                 startAt: "2023-12-27T19:11:00",
                 endAt: "2023-12-27T19:11:00",
                 allDay: true, 
                 memo: "",
                 notification: true, 
                 repeatString: "repeat process",
                 complete: false),
        Schedule(name: "12월 4일", 
                 startAt: "2023-12-04T19:11:00",
                 endAt: "2023-12-04T19:11:00",
                 allDay: true,
                 memo: "",
                 notification: true,
                 repeatString: "repeat process",
                 complete: false),
        Schedule(name: "1월 8일",
                 startAt: "2024-01-08T19:11:00",
                 endAt: "2024-01-08T19:11:00",
                 allDay: true,
                 memo: "",
                 notification: true,
                 repeatString: "repeat process",
                 complete: false),
        Schedule(name: "1월 23일", 
                 startAt: "202-01-23T19:11:00",
                 endAt: "2024-01-23T19:11:00",
                 allDay: true, 
                 memo: "",
                 notification: true, 
                 repeatString: "repeat process",
                 complete: false)
        ]
    ) {
        self.schedules = schedules
    }
   

    
}

