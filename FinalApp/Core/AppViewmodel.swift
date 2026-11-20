import SwiftUI

@Observable class CtdViewmodel {
    let db = Database()
    var account: Account? = nil
    var partner: Account? = nil
    var notifications: [NotificationItem] = []
    var generatedIdeas: [Idea] = [
        Idea(title: "Share a recipe", desc: "Cook the same meal", type: .Food),
        Idea(title: "House Tour", desc: "Show off your house", type: .Activity),
        Idea(title: "Best of 3", desc: "Pick 3 games to play", type: .Game),
        Idea(title: "Food review", desc: "Do a faux food review", type: .Food),
        Idea(title: "Movie night", desc: "Watch a movie", type: .Activity)
    ]
    
    func getThisOrThat() -> AnswerSet {
        return db.getThisOrThat()
    }
    
    func syncNotifications() {
        if let acc = account {
            db
                .retrieveNotifications(forUser: acc.id)
                .forEach { not in
                    notify(not: not)
                }
        }
    }
    
    func login(_ username: String, _ password: String) {
        account = db.doLogin(username, password)
        if let acc = account {
            partner = db.retrievePartnerFor(acc.id)
        }
        syncNotifications()
    }
    
    func logout() {
        clearNotifications()
        account = nil
    }
    
    private func notify(not: NotificationItem) {
        notifications.append(not)
    }
    
    func notify(_ title: String, _ message: String = "") {
        notify(not: NotificationItem(title: title, message: message))
    }
    
    func clearNotifications() {
        notifications = []
    }
    
    func shareNotification(_ title: String, _ message: String = "") {
        db.uploadNotification(NotificationItem(title: title, message: message), account!.id, partner?.id)
    }
}

class Database {
    typealias AccRecord = (password: String, acc: Account)
    typealias NotificationRecord = (
        from: UUID?,
        to: UUID?,
        notif: NotificationItem
    )
    
    let accounts: [AccRecord]
    var notifications: [NotificationRecord]
    var thisOrThat: AnswerSet? = nil
    
    init() {
        let janeID = UUID()
        let bingleyID = UUID()
        let jane = Account(
            id: janeID,
            name: "Jane Bennet",
            partner: bingleyID,
            plan: .Free,
            timezone: TimeZone(identifier: "Europe/London")!,
            email: "janebennet@aol.com",
            loc: "Longburough"
        )
        let bingley = Account(
            id: bingleyID,
            name: "Mr. Bingley",
            partner: janeID,
            plan: .Free,
            timezone: TimeZone(identifier: "Europe/London")!,
            email: "bingley@gmail.com",
            loc: "Netherfield"
        )
        accounts = [
            ("PNP1", jane),
            ("PNP2", bingley)
        ]
        notifications = []
    }
    
    func getThisOrThat() -> AnswerSet {
        if thisOrThat == nil {
            thisOrThat = tOrTs.randomElement()!
        }
        return thisOrThat!
    }
    
    func retrievePartnerFor(_ forUser: UUID) -> Account? {
        if let acc = findUserById(forUser)?.partner {
            return findUserById(acc)
        } else {
            return nil
        }
    }
    
    private func findUserById(_ id: UUID) -> Account? {
        return accounts
            .filter { record in record.acc.id == id }
            .map { record in record.acc }
            .first
    }
    
    func doLogin(_ username: String, _ password: String) -> Account? {
        let accs = accounts
            .filter { record in record.password == password && record.acc.email == username }
            .map { record in record.acc }
        if accs.count != 1 {
            return nil
        } else {
            return accs[0]
        }
    }
    
    func retrieveNotifications(forUser: UUID) -> [NotificationItem] {
        let pending = notifications
            .filter { record in record.to == forUser }
        notifications.removeAll { record in pending.contains(where: { r in r == record }) }
        return pending.map { record in record.notif }
    }
    
    func uploadNotification(_ notif: NotificationItem, _ uploader: UUID, _ forUser: UUID?) {
        notifications.append((
            from: uploader,
            to: forUser,
            notif: notif
        ))
    }
}

private let tOrTs: [AnswerSet] = [
    ("Cats or Dogs", "Cats", "Dogs"),
    ("Tacos or Pizza", "Tacos", "Pizza"),
    ("Mountains or Beach", "Mountains", "Beach")
]
