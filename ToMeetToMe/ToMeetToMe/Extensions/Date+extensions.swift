//
//  Date+extensions.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import Foundation

extension Date {
    static let calendarDayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "MMMM yyyy dd"
        return formatter
    }()
    
    // 날짜를 oo월 oooo(년) oo(일) 형식으로 반환
    var formattedCalendarDayDate: String {
        return Date.calendarDayDateFormatter.string(from: self)
    }
}
