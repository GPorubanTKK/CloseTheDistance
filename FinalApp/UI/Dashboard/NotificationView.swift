
import SwiftUI

// 1. Create a model to hold both the title and date


struct NotificationView: View {
    
    // Sample data using the new model
    let notifs: [NotificationItem]
    
    let cardBackground = Color(red: 0.16, green: 0.22, blue: 0.27)
    let coralAccent = Color(red: 0.93, green: 0.45, blue: 0.34)
    let sageAccent = Color(red: 0.48, green: 0.65, blue: 0.64)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                if(notifs.isEmpty) {
                    Text("None for now").foregroundStyle(.white).italic()
                } else {
                    ForEach(notifs) { item in
                        // Individual Notification Card
                        HStack(spacing: 16) {
                            // Accent indicator bar
                            RoundedRectangle(cornerRadius: 4)
                                .fill(coralAccent)
                                .frame(width: 4, height: 40)
                            
                            // Title and Date
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(item.timestamp, format: .dateTime.month().day().year())
                                    .font(.subheadline)
                                    .foregroundColor(sageAccent)
                            }
                            
                            Spacer()
                            
                            // Optional calendar icon
                            Image(systemName: "bell.fill")
                                .foregroundColor(coralAccent.opacity(0.8))
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(cardBackground)
                        )
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NotificationView(notifs: [
        NotificationItem(title: "Go to the park"),
        NotificationItem(title: "Birdwatch together"),
        NotificationItem(title: "Coffee date downtown")
    ])
}
