//
//  Schedule.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import SwiftUI

class Schedule: ObservableObject, Identifiable{
    let id = UUID()
    @Published var name: String = ""
    @Published var startAt: Date
    @Published var endAt: Date
    var allDay: Bool
    var memo: String = ""
    var notification: Bool
    @Published var complete: Bool
    
    init(name: String, startAt: String, endAt: String, allDay: Bool, memo: String, notification: Bool, complete: Bool) {
        self.name = name
        self.startAt = startAt.toDate() ?? Date()
        self.endAt = endAt.toDate() ?? Date()
        self.allDay = allDay
        self.memo = memo
        self.notification = notification
        self.complete = complete
    }
    
    public func isSameDate(inDate currentDate: Date) -> Bool {
        print(currentDate.formattedCalendarDayDate)
        let calendar = Calendar.current
        let startcomponents = calendar.dateComponents([.year, .month, .day], from: self.startAt)
        let currentDateComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        return (startcomponents.year == currentDateComponents.year) && (startcomponents.month == currentDateComponents.month) && (startcomponents.day == currentDateComponents.day)
    }
}

extension Schedule {
    
    static var scheduleArray: [Schedule] {
        [
            Schedule(name: "ㅠㅠㅠ", startAt: "2023-10-18 04:11:00 +0000", endAt: "2023-10-18 04:11:00 +0000", allDay: true, memo: "오늘 저녁은 고기!", notification: true, complete: false),
            Schedule(name: "hi", startAt: "2023-10-24 04:11:00 +0000", endAt: "2023-10-24 04:11:00 +0000", allDay: true, memo: "오늘은 뭐먹지?", notification: true, complete: false),
            Schedule(name: "뭐함", startAt: "2023-10-12 04:11:00 +0000", endAt: "2023-10-12 04:11:00 +0000", allDay: true, memo: "오늘 저녁은 고기!", notification: true, complete: false),
            Schedule(name: "어렵다", startAt: "2023-10-14 04:11:00 +0000", endAt: "2023-10-14 04:11:00 +0000", allDay: true, memo: "오늘 저녁은 고기!", notification: true, complete: false)
        ]
    }
}


// {
//"name" : "밥먹기",
//"startAt" : "2023-03-17T19:11:00",
//"endAt" : "2023-03-17T19:11:00",
//"allDay" : "true",
//"memo" : "오늘 저녁은 고기!",
//"notification" : "true",
//"repeat" : "repeat process", // 구체적인 반복 방법 작성
//"complete" : "false"
//}

