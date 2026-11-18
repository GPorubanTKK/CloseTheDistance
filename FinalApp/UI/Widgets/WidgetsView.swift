import SwiftUI

struct WidgetsView: View {
    @Environment(CtdViewmodel.self) var appVm: CtdViewmodel
    
    var body: some View {
        GeometryReader { gp in
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    Text("Activity Center").bold()
                    ThisOrThat().padding().frame(height: gp.size.height / 2)
                    DailyDoodle().padding().frame(height: gp.size.height / 2)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var vm = CtdViewmodel()
    WidgetsView().environment(vm)
}
