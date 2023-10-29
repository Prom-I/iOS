//
//  CalendarView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/11.
//

import SwiftUI

struct CalendarView: View {
    @State var month: Date  // 현재 달
    @State var clickedCurrentMonthDates: Date?  
    @State
    var scheduleArray = Schedule.scheduleArray
    @State
    var calendarScheduleArray: [Schedule] = []
    
    @State var shouldShowDetailSchedule: Bool = false
    
    init(month: Date = Date(), clickedCurrentMonthDates: Date? = nil) {
        _month = State(initialValue: month)
        _clickedCurrentMonthDates = State(initialValue: clickedCurrentMonthDates)
    }
    
    var body: some View {
        VStack {
            headerView
            calendarGridView
        }
    }
     
    // < 2023년 10월 >
    // 일 월 화 수 목 금 토
    // 날짜와 요일 표시
    private var headerView: some View {
        VStack {
            YearMonthView
                .padding(.horizontal, 10)
                .padding(.bottom, 16)
            
            HStack {
                ForEach(Self.weekdaySymbols.indices, id: \.self) { symbol in
                    Text(Self.weekdaySymbols[symbol].uppercased())
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 14))
                }
            }.padding(.bottom, 5)
        }
    }
    
    // MARK: - YYYY년 MM월 표시
    private var YearMonthView: some View {
        HStack(alignment: .center, spacing: 10) {
            // < 모양 버튼
            Button(action: {changeMonth(by: -1)}, label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16))
                    .foregroundColor(canMoveToPreviousMonth() ? .black : . gray) // 이전 달로 이동할 수 있는 여부에 따라 배경색, 활성화 설정
            })
            .disabled(!canMoveToPreviousMonth())
            
            Text(month, formatter: Self.calendarHeaderDateFormatter)
                .font(.title2.bold())   // oooo년 oo월 텍스트
            
            // > 모양 버튼
            Button(action: {changeMonth(by: 1)}, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 16))
                    .foregroundColor(canMoveToNextMonth() ? .black : . gray) // // 다음 달로 이동할 수 있는 여부에 따라 배경색, 활성화 설정
            })
            .disabled(!canMoveToNextMonth())
            
            Spacer()
        }
    }
    
    private var calendarGridView: some View {
        let daysInMonth: Int = numberOfDays(in: month)  // 해당 달의 일 수
        let firstWeekday: Int = firstWeekDayOfMonth(in: month) - 1
        let lastDayOfMonthBefore = numberOfDays(in: previousMonth())
        let numberOfRows = Int(ceil(Double(daysInMonth + firstWeekday) / 7.0))  // 해당 달이 몇주인지
        let visibleDaysOfNextMonth = numberOfRows * 7 - (daysInMonth + firstWeekday)
        
        return ScrollView{ LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 4) {
            ForEach(-firstWeekday ..< daysInMonth + visibleDaysOfNextMonth, id: \.self) { index in
                Group {
                    if index > -1 && index < daysInMonth {  // index : 0 ~ 해당 달의 일 수 - 1일 때
                        let date = getDate(for: index)
                        
                        let schedules: [Schedule] = scheduleArray.filter {
                            $0.isSameDate(inDate: date)
                        }
                        
                        let day = Calendar.current.component(.day, from: date)  // oo(일)
                        let clicked = clickedCurrentMonthDates == date
                        let isToday = date.formattedCalendarDayDate == today.formattedCalendarDayDate
                        
                        CellView(day: day, clicked: clicked, isToday: isToday, daySchedules: schedules)
                    }
                    else if let prevMonthDate = Calendar.current.date(byAdding: .day, value: index + lastDayOfMonthBefore, to: previousMonth()) {
                        let schedules: [Schedule] = scheduleArray.filter {
                            $0.isSameDate(inDate: prevMonthDate)
                        }
                        
                        let day = Calendar.current.component(.day, from: prevMonthDate)
                        
                        CellView(day: day, isCurrentMonthDay: false, daySchedules: schedules)
                    }
                }.padding(0)
                .onTapGesture {
                    if 0 <= index && index < daysInMonth {
                        let date = getDate(for: index)
                        clickedCurrentMonthDates = date
                    }
                }
            }
        }.padding(.horizontal, 8)
        }
    }
    
    struct CellView: View {
        private var day: Int
        private var clicked: Bool
        private var isToday: Bool
        private var isCurrentMonthDay: Bool
        private var textColor: Color {
            if clicked {
                return Color.white
            } else if isToday{
                return Color.mintColor
            } else {
                return Color.gray
            }
        }
        private var backgroundColor: Color {
            if clicked {
                return Color.black
            } else if isToday {
                return Color.lightGray
            } else {
                return Color.white
            }
        }
        @State
        var daySchedules: [Schedule]
        
        fileprivate init( // 동일한 소스 파일에서만 접근 가능
            day: Int,
            clicked: Bool = false,
            isToday: Bool = false,
            isCurrentMonthDay: Bool = true,
            daySchedules: [Schedule] = []
        ) {
            self.day = day
            self.clicked = clicked
            self.isToday = isToday
            self.isCurrentMonthDay = isCurrentMonthDay
            self.daySchedules = daySchedules
        }
        
        
        
        internal var body: some View {
            VStack(spacing:4) {
                Circle()
                    .fill(backgroundColor)
                    .overlay(Text(String(day))).font(.system(size: 14)) // oo일 텍스트
                    .foregroundColor(textColor)
                    .frame(width: 24, height: 24)
                    .padding(.vertical, 2)
                
                ZStack(alignment: .top) {
//                    RoundedRectangle(cornerSize: .init(width: 6, height: 6))  // 계획 들어갈 공간 대체
//                        .fill(Color.white)
//                        .zIndex(0)
                        
                    VStack(spacing: 4) {
                        
                        ForEach(daySchedules, content: { (schedule: Schedule) in
                            Rectangle()
                                .fill(Color.lightMint)
                                .frame(height:16)
                                .cornerRadius(2)
                                .overlay(Text(schedule.name).font(.system(size: 12)))
                        })
                        
                        
                      
                    }.padding(.horizontal, 2)
                }
                
                Spacer()
                
            }
            .frame(width: 58,height: 120)
            .background(clicked ? Color.gray1 : Color.clear)
       
            
            

        }
    }
}

private extension CalendarView {
    var today: Date {
        let now = Date()
        let components = Calendar.current.dateComponents([.year, .month, .day], from: now)  // 현재 시간을 년도, 월, 일 형식의 날짜로
        return Calendar.current.date(from: components)!
    }

    // oooo년 oo월로 바꿔줄 포매터
    static let calendarHeaderDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 MM월"
        return formatter
    }()
    
    // ["일", "월", "화", "수", "목", "금", "토"]
    static let weekdaySymbols: [String] = Calendar.current.shortWeekdaySymbols
}

private extension CalendarView {
    // 특정 해당 날짜 (firstDayOfMonth = oooo년 oo월 1일 or 현재 날짜)
    func getDate(for index: Int) -> Date {  // oo일
        let calendar = Calendar.current
        guard let firstDayOfMonth = calendar.date(
            from: DateComponents(
                year: calendar.component(.year, from: month),
                month: calendar.component(.month, from: month),
                day: 1
            )
        ) else {
            return Date()
        }
        
        var dateComponents = DateComponents()
        dateComponents.day = index
        
        let timeZone = TimeZone.current
        let offset = Double(timeZone.secondsFromGMT(for: firstDayOfMonth))
        dateComponents.second = Int(offset)
        
        // 특정 해당 oooo년 oo월 1일에서 index일 만큼 더한 날짜 구하기
        let date = calendar.date(byAdding: dateComponents, to: firstDayOfMonth) ?? Date()
    
        return date
    }
    
    // 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    // 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    // 특정 날짜를 입력으로 받아 그 달의 첫째 날의 요일을 정수로 반환
    func firstWeekDayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year,.month], from: date)
        // 자동으로 월의 1일로 설정됨
        let firstDayOfMonth = Calendar.current.date(from: components)!
    
        // 일요일부터 1, ~.. 토요일은 7
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    // 이전 월 마지막 일자
    func previousMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        
        // 해당 월의 1일
        let firstDayOfMoth = Calendar.current.date(from: components)!
        let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: firstDayOfMoth)!
        
        return previousMonth
    }
    
    // 월 변경
    func changeMonth(by value: Int) {
        self.month = adjustedMonth(by: value)
    }
    
    // 이전 월로 이동 가능한지 확인
    func canMoveToPreviousMonth() -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        // 현재 달의 -3달
        let targetDate = calendar.date(byAdding: .month, value: -3, to: currentDate) ?? currentDate
        
        // 변경하려는 달이 현재 달의 -3달보다 이전일 경우 이동 불가능
        if adjustedMonth(by: -1) < targetDate {
            return false
        }
        return true
    }
    
    // 다음 월로 이동 가능한지 확인
    func canMoveToNextMonth() -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        // 현재 달의 +3달
        let targetDate = calendar.date(byAdding: .month, value: 3, to: currentDate) ?? currentDate
        
        // 변경하려는 달이 현재 달의 +3달보다 이전일 경우 이동 불가능
        if adjustedMonth(by: 1) > targetDate {
            return false
        }
        return true
    }
    
    // 변경하려는 월 반환
    func adjustedMonth(by value: Int) -> Date {
        if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: month) {
            return newMonth
        }
        return month
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
