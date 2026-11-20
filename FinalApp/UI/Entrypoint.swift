import SwiftUI

struct Entrypoint: View {
    @State var loggedIn = false
    
    var body: some View {
        if(loggedIn) {
            MainContent(loggedIn: $loggedIn)
        } else {
            LoginScreen(loggedIn: $loggedIn)
        }
    }
}

#Preview {
    Entrypoint()
}
