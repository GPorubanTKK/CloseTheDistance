import SwiftUI

struct DistanceCardView: View {
    @Environment(CtdViewmodel.self) var appVm: CtdViewmodel
    // Sample data matching the screenshot
    let distance: Int = 849
    // Sample data that will be replaced
    let distanceApart = "3,459 miles"
    let nextVisitDate = "Dec 18, 2026"
    let daysUntilVisit = "29 days"
    
    func getLondonTimeString() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = appVm.account?.timezone ?? TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "h:mm a" //I will add funtionality for a 24 hour clock too
        return formatter.string(from: Date())
    }
    
    var body: some View {
        // Top Status Card
        VStack(alignment: .leading, spacing: 20) {
            // Row 1: Local Time
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Label("\(0) Local Time", systemImage: "clock.fill")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))
                    Text(getLondonTimeString())
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
                Spacer()
            }
        }
        .padding()
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .padding(.horizontal)
        
        VStack(spacing: 22) {
            // city and icons
            HStack {
                HStack(spacing: 10) {
                    AvatarBadge(initial: String((appVm.account?.name ?? "??").prefix(0)), color: coralAccent)
                    Text(appVm.account?.loc ?? "??")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 10) {
                    Text(appVm.partner?.loc ?? "??")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    AvatarBadge(initial: String((appVm.partner?.name ?? "??").prefix(0)), color: sageAccent)
                }
            }
            
            // Middle Row: Dashed Line with Endpoints and Heart
            HStack(spacing: 0) {
                EndpointCircle()
                
                DashedLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
                    .foregroundColor(.white.opacity(0.6))
                    .frame(height: 2)
                
                Image(systemName: "heart")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(coralAccent)
                    .padding(.horizontal, 8)
                
                DashedLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 5]))
                    .foregroundColor(.white.opacity(0.6))
                    .frame(height: 2)
                
                EndpointCircle()
            }
            .padding(.horizontal, 10)
            
            // Bottom Section: Distance Readout and Privacy Note
            VStack(spacing: 6) {
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text("\(distance)")
                        .font(.system(size: 56, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("mi")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                
                Divider()
                    .background(.white.opacity(0.9))
                
                //Distance & Next Visit
                HStack(alignment: .top) {
                
                    VStack(alignment: .trailing, spacing: 4) {
                        Label("Next Visit (\(daysUntilVisit))", systemImage: "calendar")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.85))
                        Text(nextVisitDate)
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .padding(24)
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .padding()
    }
}




struct EndpointCircle: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 2.5)
                .frame(width: 14, height: 14)
            Circle()
                .fill(Color.white)
                .frame(width: 5, height: 5)
        }
    }
}

struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width, y: rect.midY))
        return path
    }
}

#Preview {
    DistanceCardView()
}
