import SwiftUI

struct WidgetsView: View {
    @Environment(CtdViewmodel.self) var appVm: CtdViewmodel
    
    var body: some View {
        GeometryReader { gp in
            VStack {
                Text("Activity Center").bold()
                ThisOrThat().padding().frame(height: gp.size.height / 2)
                VStack {
                    Text("Daily Doodle")
                    Text("Coming Soon")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var vm = CtdViewmodel()
    WidgetsView().environment(vm)
}
