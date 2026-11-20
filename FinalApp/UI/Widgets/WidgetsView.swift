import SwiftUI

struct WidgetsView: View {
    init() {
        InitNavTitle()
    }
    
    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()
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
        .navigationTitle("Activities")
        .foregroundStyle(.white)
    }
}

#Preview {
    @Previewable @State var vm = CtdViewmodel()
    WidgetsView().environment(vm)
}
