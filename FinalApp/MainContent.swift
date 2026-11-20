import Playgrounds
import SwiftUI

struct MainContent: View {
    @State var vm = CtdViewmodel()
    @State var selection = 0
    @Binding var loggedIn: Bool
    
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
            AccountView(loggedIn: $loggedIn).tabItem {
                Label("Account", systemImage: "person.crop.circle")
            }
        }.environment(vm)
    }
}

#Preview {
    @Previewable @State var li = true
    MainContent(loggedIn: $li)
}
