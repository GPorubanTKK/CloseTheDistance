import SwiftUI

struct CalenderView: View {
    @StateObject var vm: CalendarVM = CalendarVM()
    @Environment(CtdViewmodel.self) var appVm: CtdViewmodel
    @State var selectedDate: Date = .now
    
    
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
                                    selectedDate = vm.month
                                } label: {
                                    Text("<")
                                }
                                Text(vm.month, format: .dateTime.month().year())
                                Button {
                                    vm.nextMonth()
                                    selectedDate = vm.month
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
                            var dowCounter = 2-dc.weekday!
                            ForEach(0 ..< 6) { _ in
                                HStack {
                                    ForEach(0 ..< 7) { _ in
                                        if(daysOfMonth.contains(dowCounter)) {
                                            let date = Calendar.current.date(byAdding: .day, value: dowCounter-1, to: vm.month)!
                                            CalendarDay(day: dowCounter, dayType: appVm.plannedDates[date] != nil ? .Date : .Free)
                                                .frame(width: gp.size.width / 9, height: gp.size.height / 3 / 7.5)
                                                .onTapGesture {
                                                    selectedDate = date
                                                }
                                        } else {
                                            Rectangle().foregroundStyle(.clear).frame(width: gp.size.width / 9, height: gp.size.height / 3 / 7.5)
                                        }
                                        let _ = dowCounter += 1
                                    }
                                }
                            }
                        }.padding([.top])
                    }
                    HStack {
                        if(appVm.plannedDates[selectedDate] == nil) {
                            Text("Date Ideas For")
                            Text(selectedDate, format: .dateTime.month().year().day())
                        } else {
                            Text("Date Planned For")
                            Text(selectedDate, format: .dateTime.month().year().day())
                        }
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
                    if(appVm.plannedDates[selectedDate] == nil) {
                        ScrollView {
                            LazyVStack(alignment: .leading) {
                                ForEach(appVm.generatedIdeas.shuffled().prefix(3), id: \.title) { idea in
                                    HStack {
                                        DateIdea(title: idea.title, desc: idea.desc, type: idea.type)
                                        Spacer()
                                        Button {
                                            appVm.planDate(selectedDate, idea)
                                        } label: {
                                            Text("Plan")
                                        }
                                    }
                                }
                            }.padding()
                        }
                    } else {
                        let idea = appVm.plannedDates[selectedDate]!
                        DateIdea(title: idea.title, desc: idea.desc, type: idea.type)
                    }
                }
            }
        }.onAppear {
            selectedDate = vm.month
        }
    }
}

#Preview {
    @Previewable @State var appvm = CtdViewmodel()
    CalenderView().environment(appvm)
}
