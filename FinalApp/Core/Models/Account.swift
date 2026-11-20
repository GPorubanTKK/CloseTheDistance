import Foundation
struct Account: CtData {
    let id: UUID
    let name: String
    let partner: UUID
    let plan: AccountPlan
    let timezone: TimeZone
}

enum AccountPlan: String, Codable, Hashable {
    case Free = "free"
    case Paid = "paid"
}

public typealias CtData = Codable & Hashable & Identifiable
