//
//  CalendarView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/11.
//

import SwiftUI

struct CalendarView: View {
    @State var month: Date
    @State var offset: CGSize = CGSize()
    @State var clickedDates: Set<Date> = []
    
    var body: some View {
        VStack {
            headerView
            calendarGridView
        }
    }
     
    private var headerView: some View {
        VStack {
            Text("10월 11일")
                .font(.title)
                .padding(.bottom)
            
            
        }
    }
    private var calendarGridView: some View {
        VStack {
            
        }
    }
}

//// MARK: - Static 프로퍼티
//extension CalenderView {
//  static let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "MMMM yyyy"
//    return formatter
//  }()
//
//  static let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
//}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
