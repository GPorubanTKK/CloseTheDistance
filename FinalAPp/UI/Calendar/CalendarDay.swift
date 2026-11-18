import SwiftUI
struct CalendarDay : View {
    var day: Int
    var dayType: DayType
    
    
    var body: some View {
        ZStack {
            Circle().foregroundStyle(.gray.opacity(0.2)).shadow(radius: 1)
            VStack {
                Text("\(day)").font(.system(size: 10))
                Image(systemName: dayType.rawValue).font(.system(size: 10))
            }.padding()
        }.fixedSize()
    }
}


enum DayType: String {
    case Free = ""
    case Date = "heart.fill"
    case Holiday = "app.gift"
}

#Preview {
    CalendarDay(day: 12, dayType: .Holiday)
}
