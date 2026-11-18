import Playgrounds
import SwiftUI

struct ContentView: View {
    @State var vm = CtdViewmodel()
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            CalenderView().tabItem {
                Label("Dates", systemImage: "calendar")
            }.tag(0)
            WidgetsView().tabItem {
                Label("Games", systemImage: "widget.small")
            }.tag(1)
        }.environment(vm)
    }
}

#Preview {
    ContentView()
}
