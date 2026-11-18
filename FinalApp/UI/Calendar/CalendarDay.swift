import SwiftUI
struct CalendarDay : View {
    var day: Int
    var dayType: DayType
    
    
    var body: some View {
        ZStack {
            Circle().foregroundStyle(.gray.opacity(0.2)).shadow(color: .black, radius: 1)
            VStack {
                Text(day, format: .number).minimumScaleFactor(0.6)
                Image(systemName: dayType.rawValue).font(.system(size: 10))
            }
        }
    }
}


enum DayType: String {
    case Free = ""
    case Date = "heart.fill"
    case Holiday = "app.gift"
}

#Preview {
    CalendarDay(day: 30, dayType: .Holiday)
}
