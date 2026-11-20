import SwiftUI

struct DashboardView: View {
    @Environment(CtdViewmodel.self) var appVm: CtdViewmodel
    
    var body: some View {
        ZStack {
        
            backgroundGradient
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Couple Name")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                            .foregroundStyle(Color.white)

                        Text("Jane & Bingley")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)

                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                
                DistanceCardView()
                
                //Notification Section
                VStack(alignment: .center, spacing: 8) {
                    HStack {
                        Text("Notifications")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            
                        Spacer()
                        Button("Clear") {
                            appVm.clearNotifications()
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .controlSize(.regular)
                    }
                    .padding(.horizontal)
                    
                    NotificationView(notifs: appVm.notifications)
                }
            }
            .padding(.top)
        }
    }
}

struct AvatarBadge: View {
    let initial: String
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
            Circle()
                .stroke(Color.white.opacity(0.85), lineWidth: 2)
            Text(initial)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: 34, height: 34)
        .padding(.top)
              // Forces default text like "Jane & Bingley" and "Notifications" to stay crisp white
        
    }
}





#Preview {
    @Previewable @State var vm = CtdViewmodel()
    DashboardView().environment(vm)
}
