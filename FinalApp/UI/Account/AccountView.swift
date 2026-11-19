import SwiftUI

struct AccountView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    
    var body: some View {
        NavigationStack {
            List {
                //Profile head
                Section {
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.blue)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Jane Bennet")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("jane.Bennet@Longburouh.com")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 6)
                }
                
                //account sections
                Section("Account") {
                    NavigationLink(destination: Text("Edit Profile Screen")) {
                        Label("Edit Profile", systemImage: "pencil")
                    }
                    NavigationLink(destination: Text("Security & Password Screen")) {
                        Label("Password & Security", systemImage: "lock")
                    }
                    NavigationLink(destination: Text("Billing Details Screen")) {
                        Label("Subscription", systemImage: "creditcard")
                    }
                    NavigationLink(destination: Text("Location Settings Screen")) {
                        Label("Location", systemImage: "map")
                    }
                }
                
                // 3. Preferences Section
                Section("Preferences") {
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Allow Notifications", systemImage: "bell")
                    }
                    NavigationLink(destination: Text("To Be Implemented")) {
                        Label("Color Scheme", systemImage: "circle.lefthalf.filled")
                    }
                }
                
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
                }
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}

