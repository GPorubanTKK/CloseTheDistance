import SwiftUI

struct CalenderView: View {
    @StateObject var vm: CalendarVM = CalendarVM()
    
    
    let dows = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        ZStack {
            GeometryReader { gp in
                VStack {
                    Text("My Calendar")
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: gp.size.height / 2.5)
                            .padding()
                            .foregroundStyle(Color(hue: 0, saturation: 0, brightness: 0.9))
                            .shadow(radius: 2)
                        VStack {
                            HStack {
                                Button {
                                    vm.prevMonth()
                                } label: {
                                    Text("<")
                                }
                                Text(vm.month, format: .dateTime.month().year())
                                Button {
                                    vm.nextMonth()
                                } label: {
                                    Text(">")
                                }
                            }.fixedSize()
                            HStack {
                                ForEach(dows, id: \.self) { dow in
                                    Text(dow).bold().frame(width: gp.size.width / 9)
                                }
                            }
                            let daysOfMonth = Calendar.current.range(of: .day, in: .month, for: vm.month)!
                            let dc = Calendar.current.dateComponents([.weekday, .day], from: vm.month)
                            var dowCounter = 2 - dc.weekday!
                            ForEach(0 ..< 6) { _ in
                                HStack {
                                    ForEach(0 ..< 7) { _ in
                                        if(daysOfMonth.contains(dowCounter)) {
                                            CalendarDay(day: dowCounter, dayType: .Free)
                                                .frame(width: gp.size.width / 9, height: gp.size.height / 3 / 7)
                                        } else {
                                            Image(systemName: "circle").frame(width: gp.size.width / 9, height: gp.size.height / 3 / 7)
                                        }
                                        let _ = dowCounter += 1
                                    }
                                }
                            }
                        }.padding([.top])
                    }
                    HStack {
                        Text("Date Ideas")
                        Spacer()
//                        Button {
//                            //TODO
//                        } label: {
//                            ZStack {
//                                Capsule(style: .circular)
//                                    .rotation(.degrees(0))
//                                    .stroke(style: StrokeStyle(lineWidth:2))
//                                    .foregroundStyle(.gray)
//                                Text("Filter").foregroundStyle(.black)
//                                    .padding([.leading, .trailing])
//                            }.fixedSize()
//                        }
                    }.padding()
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(vm.dates, id: \.title) { idea in
                                DateIdea(title: idea.title, desc: idea.desc, type: idea.type)
                            }
                        }.padding()
                    }
                }
            }
        }
    }
}

#Preview {
    CalenderView()
}
