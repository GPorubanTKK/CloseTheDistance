import Foundation
public import Combine
class CalendarVM: ObservableObject {
    @Published var month: String = months[0]
    @Published var days: [Day] = (1...31).map { num in Day(day: num, status: DayType.Date) }
    @Published var dates: [Idea] = [Idea(title: "Cook a meal", desc: "Cook dinner together", type: .Food)]
    private var monthIndex = 0
    
    func changeMonth(direction: Int) {
        monthIndex += direction < 0 ? -1 : 1
        monthIndex %= 12
        month = months[monthIndex]
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

private var months: [String] = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]
