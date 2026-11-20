import SwiftUI
import UIKit

struct AccountView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @Binding var loggedIn: Bool
    
    init(loggedIn: Binding<Bool>) {
        InitNavTitle()
        self._loggedIn = loggedIn
    }
    
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
                            Label {
                                Text("Edit Profile")
                                    .foregroundStyle(.white)
                            } icon: {
                                Image(systemName: "pencil")
                                    .foregroundStyle(coralAccent)
                            }
                        }

                        NavigationLink(destination: Text("Security & Password Screen")) {
                            Label {
                                Text("Password & Security")
                                    .foregroundStyle(.white)
                            } icon: {
                                Image(systemName: "lock")
                                    .foregroundStyle(coralAccent)
                            }
                        }

                        NavigationLink(destination: Text("Billing Details Screen")) {
                            Label {
                                Text("Subscription")
                                    .foregroundStyle(.white)
                            } icon: {
                                Image(systemName: "creditcard")
                                    .foregroundStyle(coralAccent)
                            }
                        }

                        NavigationLink(destination: Text("Location Settings Screen")) {
                            Label {
                                Text("Location")
                                    .foregroundStyle(.white)
                            } icon: {
                                Image(systemName: "map")
                                    .foregroundStyle(coralAccent)
                            }
                        }
                    }.listRowBackground(cardBackground)
                    
                    // Preferences Section
                    Section("Preferences") {
                        Toggle(isOn: $notificationsEnabled) {
                            Label {
                                Text("Allow Notifications")
                                    .foregroundStyle(Color.white)
                            } icon: {
                                Image(systemName: "bell")
                                    .foregroundStyle(coralAccent)
                            }
                        }
                        .tint(coralAccent)
                        
                        NavigationLink(destination: Text("To Be Implemented")) {
                            Label {
                                Text("Color Scheme")
                                    .foregroundStyle(Color.white)
                            } icon: {
                                Image(systemName: "circle.lefthalf.filled")
                                    .foregroundStyle(coralAccent)
                            }
                        }
                    }.listRowBackground(cardBackground)
                    
                    //Sign out button
                    Section {
                        Button(role: .destructive) {
                            loggedIn = false
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
    @Previewable @State var li = false
    AccountView(loggedIn: $li)
}
