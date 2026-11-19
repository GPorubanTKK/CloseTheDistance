import SwiftUI

struct DistanceCardView: View {
    // Sample data matching the screenshot
    let leftInitial: String = "J"
    let leftCity: String = "Longburough"
    let rightInitial: String = "B"
    let rightCity: String = "Netherfield"
    let distance: Int = 849
    // Sample data that will be replaced
    let partnerTimeZon = "London"
    let partnerTime = "3:22 PM"
    let distanceApart = "3,459 miles"
    let nextVisitDate = "Dec 18, 2026"
    let daysUntilVisit = "29 days"
    
    // Colors sampled from the design
    let cardBackground = Color(red: 0.16, green: 0.22, blue: 0.27)
    let coralAccent = Color(red: 0.93, green: 0.45, blue: 0.34)
    let sageAccent = Color(red: 0.48, green: 0.65, blue: 0.64)
    
    var body: some View {
        
        
        // Top Status Card
        VStack(alignment: .leading, spacing: 20) {
            // Row 1: Local Time
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Label("\(partnerTimeZon) Local Time", systemImage: "clock.fill")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))
                    Text(partnerTime)
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
                    AvatarBadge(initial: leftInitial, color: coralAccent)
                    Text(leftCity)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 10) {
                    Text(rightCity)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    AvatarBadge(initial: rightInitial, color: sageAccent)
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
