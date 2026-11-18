import SwiftUI

@Observable class CtdViewmodel {
    var plannedDates: [Date: Idea] = [:]
    var generatedIdeas: [Idea] = [
        Idea(title: "Share a recipe", desc: "Cook the same meal", type: .Food),
        Idea(title: "House Tour", desc: "Show off your house", type: .Activity),
        Idea(title: "Best of 3", desc: "Pick 3 games to play", type: .Game),
        Idea(title: "Food review", desc: "Do a faux food review", type: .Food),
        Idea(title: "Movie night", desc: "Watch a movie", type: .Activity)
    ]
    
    init() {
        plannedDates = [Calendar.current.date(from: DateComponents(year: 2026, month: 12, day: 3))! : generatedIdeas[0]]
    }
    
    func planDate(_ date: Date, _ idea: Idea) {
        plannedDates[date] = idea
    }
}
