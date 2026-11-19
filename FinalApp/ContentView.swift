import Playgrounds
import SwiftUI

struct ContentView: View {
    @State var vm = CtdViewmodel()
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            DashboardView().tabItem {
                Label("Dashboard", systemImage: "square.grid.2x2")
            }.tag(0)
            CalenderView().tabItem {
                Label("Dates", systemImage: "calendar")
            }.tag(1)
            WidgetsView().tabItem {
                Label("Games", systemImage: "widget.small")
            }.tag(2)
            AccountView().tabItem {
                Label("Account", systemImage: "person.crop.circle")
            }
        }.environment(vm)
    }
}

#Preview {
    ContentView()
}
