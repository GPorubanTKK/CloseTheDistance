import SwiftUI
struct CalendarDay : View {
    var day: Int
    var dayType: DayType
    
    
    var body: some View {
        ZStack {
            Circle().foregroundStyle(.gray.opacity(0.2)).shadow(radius: 1)
            VStack {
                Text("\(day)").fontWidth(.condensed)
                Image(systemName: dayType.rawValue).font(.system(size: 10))
            }.padding()
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
