import SwiftUI

struct DailyDoodle : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).foregroundStyle(.cyan.opacity(0.3))
            VStack {
                Text("Daily Doodle").font(.largeTitle).bold()
                Text("Coming Soon").font(.title).italic().foregroundStyle(.gray)
            }
        }
    }
}
