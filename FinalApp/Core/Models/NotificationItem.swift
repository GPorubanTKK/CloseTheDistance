import Foundation
struct NotificationItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var message: String = ""
    var timestamp: Date = .now
}
