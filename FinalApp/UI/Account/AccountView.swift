import SwiftUI

struct AccountView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        // Set colors for both large and collapsed inline titles
        let titleColor = UIColor(Color.white)
        appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    let backgroundGradient = LinearGradient(
        colors: [
            Color(red: 0.15, green: 0.1, blue: 0.5),
            Color(red: 0.48, green: 0.10, blue: 0.40)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
        let cardBackground = Color(red: 0.16, green: 0.22, blue: 0.27)
        let coralAccent = Color(red: 0.93, green: 0.45, blue: 0.34)
        let sageAccent = Color(red: 0.48, green: 0.65, blue: 0.64)
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 1. Full-screen gradient behind the list
                backgroundGradient
                    .ignoresSafeArea()
                
                List {
                    Section {
                        HStack(spacing: 16) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundStyle(coralAccent)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Jane Bennet")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.white)
                                Text("jane.Bennet@Longburouh.com")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .foregroundStyle(coralAccent)
                            }
                        }
                        .padding(.vertical, 6)
                    }.listRowBackground(cardBackground)
                    
                    // Account sections
                    Section("Account") {
                        NavigationLink(destination: Text("Edit Profile Screen")) {
                            Label("Edit Profile", systemImage: "pencil")
                        }.foregroundStyle(coralAccent)
                        NavigationLink(destination: Text("Security & Password Screen")) {
                            Label("Password & Security", systemImage: "lock")
                        }.foregroundStyle(coralAccent)
                        NavigationLink(destination: Text("Billing Details Screen")) {
                            Label("Subscription", systemImage: "creditcard")
                        }.foregroundStyle(coralAccent)
                        NavigationLink(destination: Text("Location Settings Screen")) {
                            Label("Location", systemImage: "map")
                        }.foregroundStyle(coralAccent)
                    }.listRowBackground(cardBackground)
                    
                    // Preferences Section
                    Section("Preferences") {
                        Toggle(isOn: $notificationsEnabled) {
                            Label("Allow Notifications", systemImage: "bell")
                        }.foregroundStyle(coralAccent)
                        NavigationLink(destination: Text("To Be Implemented")) {
                            Label("Color Scheme", systemImage: "circle.lefthalf.filled")
                        }.foregroundStyle(coralAccent)
                    }.listRowBackground(cardBackground)
                    
                    // 4. Sign Out Action
                    Section {
                        Button(role: .destructive) {
                            print("User tapped Sign Out")
                        } label: {
                            HStack {
                                Spacer()
                                Text("Sign Out")
                                    .fontWeight(.medium)
                                Spacer()
                            }
                        }
                    }.listRowBackground(cardBackground)
                }.listRowBackground(cardBackground)
       
                .scrollContentBackground(.hidden)
            }.listRowBackground(cardBackground)
            .navigationTitle("Account")
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    AccountView()
}
