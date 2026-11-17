import SwiftUI

struct CalenderView: View {
    @StateObject var vm: CalendarVM = CalendarVM()
    
    var body: some View {
        ZStack {
            GeometryReader { gp in
                VStack {
                    Text("My Calendar")
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: gp.size.height / 3)
                            .padding()
                            .foregroundStyle(Color(hue: 0, saturation: 0, brightness: 0.9))
                            .shadow(radius: 2)
                        VStack {
                            HStack {
                                Button {
                                    vm.changeMonth(direction: -1)
                                } label: {
                                    Text("<")
                                }
                                Text(vm.month)
                                Button {
                                    vm.changeMonth(direction: 1)
                                } label: {
                                    Text(">")
                                }
                                
                                
                            }
                            LazyVGrid(
                                columns: Array(repeating: GridItem(.fixed(7)), count: 7)
                            ) {
                                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { header in
                                    Text(header).fixedSize()
                                }
                                ForEach(vm.days, id: \.self) { day in
                                    CalendarDay(day: day.day, dayType: day.status)
                                }
                            }
                        }.padding()
                    }
                    HStack {
                        Text("Date Ideas")
                        Spacer()
                        Button {
                            //TODO
                        } label: {
                            ZStack {
                                Capsule(style: .circular)
                                    .rotation(.degrees(0))
                                    .stroke(style: StrokeStyle(lineWidth:2))
                                    .foregroundStyle(.gray)
                                Text("Filter").foregroundStyle(.black)
                                    .padding([.leading, .trailing])
                            }.fixedSize()
                        }
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
