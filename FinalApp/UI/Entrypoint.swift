import SwiftUI

struct Entrypoint: View {
    @State var vm = CtdViewmodel()
    
    var body: some View {
        if(vm.account != nil) {
            MainContent().environment(vm)
        } else {
            LoginScreen().environment(vm)
        }
    }
}

#Preview {
    Entrypoint()
}
