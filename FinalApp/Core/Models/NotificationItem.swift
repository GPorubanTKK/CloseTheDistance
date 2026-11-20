import Foundation
struct NotificationItem: CtData {
    var id = UUID()
    var title: String
    var message: String = ""
    var timestamp: Date = .now
}
