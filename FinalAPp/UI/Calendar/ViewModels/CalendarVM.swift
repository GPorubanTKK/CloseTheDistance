public import Combine
import Foundation

class CalendarVM: ObservableObject {
    @Published var month: Date = .now
    @Published var dates: [Idea] = [
        Idea(title: "Cook a meal", desc: "Cook lunch together", type: .Food)
    ]
    
    init() {
        month = firstOfCurrentMonth()
    }
    
    
    func nextMonth() {
        month = Calendar.current.date(byAdding: .month, value: 1, to: month)!
    }
    
    func prevMonth() {
        month = Calendar.current.date(byAdding: .month, value: -1, to: month)!
    }
    
    private func firstOfCurrentMonth() -> Date {
        Calendar.current.date(bySetting: .day, value: 1, of: .now)!
    }
}

struct Day: Hashable {
    var day: Int
    var status: DayType
}

struct Idea: Hashable {
    var title: String
    var desc: String
    var type: DateType
}
