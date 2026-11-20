import SwiftUI

struct LoginScreen: View {
    @Binding var loggedIn: Bool
    
    var body: some View {
        Button {
            loggedIn = true
        } label: {
            Text("Login")
        }
    }
}
