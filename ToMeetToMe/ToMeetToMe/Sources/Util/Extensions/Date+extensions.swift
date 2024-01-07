//
//  Date+extensions.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import Foundation

extension Date {
    static let now: Date = {
        var now = Date()
        let timezone = TimeZone.autoupdatingCurrent
        let secondsFromGMT = timezone.secondsFromGMT(for: now)
        let localizedDate = now.addingTimeInterval(TimeInterval(secondsFromGMT))
        return localizedDate
    }()
    
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

    /**
     # dateCompare
     - Parameters:
        - fromDate: 비교 대상 Date
     - Note: 두 날짜간 비교해서 과거(Future)/현재(Same)/미래(Past) 반환
    */
    static func dateCompare(fromDate: Date, toDate: Date) -> String {
        var strDateMessage:String = ""
        let result:ComparisonResult = toDate.compare(fromDate)
        switch result {
        case .orderedAscending:
            strDateMessage = "Future"
            break
        case .orderedDescending:
            strDateMessage = "Past"
            break
        case .orderedSame:
            strDateMessage = "Same"
            break
        default:
            strDateMessage = "Error"
            break
        }
        return strDateMessage
    }
    

}
