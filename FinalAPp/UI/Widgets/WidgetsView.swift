import SwiftUI

struct WidgetsView: View {
    @Environment(CtdViewmodel.self) var appVm: CtdViewmodel
    
    var body: some View {
        VStack {
            Text("Activity Center").bold()
            VStack {
                Text("This Or That?")
                HStack {
                    Button {
                        
                    } label: {
                        
                    }
                    Button {
                        
                    } label: {
                        
                    }
                }
            }
            VStack {
                Text("Daily Doodle")
                Text("Coming Soon")
            }
        }
    }
}

#Preview {
    @Previewable @State var vm = CtdViewmodel()
    WidgetsView().environment(vm)
}
