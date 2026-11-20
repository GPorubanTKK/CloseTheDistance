import SwiftUI

struct LoginScreen: View {
    @Binding var loggedIn: Bool
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            
            VStack(spacing: 18) {
                            Spacer()
                            
                            // Header
                            VStack(spacing: 6) {
                                Text("Welcome Back")
                                    .font(.largeTitle.bold())
                                    .foregroundStyle(.white)
                                
                                Text("Sign in to continue")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.bottom, 16)
                            
                            //Email field
                            TextField("", text: $email, prompt: Text("Email address").foregroundStyle(.gray))
                                .padding(14)
                                .background(cardBackground)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                )
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                            
                            //Password textfield
                            SecureField("", text: $password, prompt: Text("Password").foregroundStyle(.gray))
                                .padding(14)
                                .background(cardBackground)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                )
                            
                            //Sign in button
                            Button {
                                // Trigger login state change
                                withAnimation {
                                    loggedIn = true
                                }
                            } label: {
                                Text("Sign In")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(14)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.top, 8)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 24)
                    }
                    .preferredColorScheme(.dark)
                }
            }
