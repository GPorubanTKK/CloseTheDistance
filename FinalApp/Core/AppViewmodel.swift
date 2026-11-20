import SwiftUI

@Observable class CtdViewmodel {
    var notifications: [NotificationItem] = []
    
    var generatedIdeas: [Idea] = [
        Idea(title: "Share a recipe", desc: "Cook the same meal", type: .Food),
        Idea(title: "House Tour", desc: "Show off your house", type: .Activity),
        Idea(title: "Best of 3", desc: "Pick 3 games to play", type: .Game),
        Idea(title: "Food review", desc: "Do a faux food review", type: .Food),
        Idea(title: "Movie night", desc: "Watch a movie", type: .Activity)
    ]
    
    private func notify(not: NotificationItem) {
        notifications.append(not)
    }
    
    func notify(_ title: String, _ message: String = "") {
        notify(not: NotificationItem(title: title, message: message))
    }
    
    func clearNotifications() {
        notifications = []
    }
}
