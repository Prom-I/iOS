//
//  String+extensions.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/22.
//

import Foundation

extension String{
    func toDate() -> Date? {    // "yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
          return nil
        }
        
    }
}
