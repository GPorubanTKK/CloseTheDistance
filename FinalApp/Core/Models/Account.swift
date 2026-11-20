import Foundation
struct Account: CtData {
    let id: UUID
    let name: String
    let partner: UUID
    let plan: AccountPlan
    let timezone: TimeZone
    let email: String
    let loc: String
}

enum AccountPlan: String, Codable, Hashable {
    case Free = "free"
    case Paid = "paid"
}

public typealias CtData = Codable & Hashable & Identifiable
