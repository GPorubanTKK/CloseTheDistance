import Foundation
public import Combine

class ThisOrThatVM: ObservableObject {    
    @Published var answer: AnswerSet = ("", "", "")
    @Published var choice = -1
    
    init() {
        answer = tOrTs.randomElement()!
    }
    
    func pickLeft() {
        if(choice < 0) {
            choice = 0
        }
    }
    
    func pickRight() {
        if(choice < 0) {
            choice = 1
        }
    }
}

private let tOrTs: [AnswerSet] = [
    ("Cats or Dogs", "Cats", "Dogs"),
    ("Tacos or Pizza", "Tacos", "Pizza"),
    ("Mountains or Beach", "Mountains", "Beach")
]

public typealias AnswerSet = (q: String, l: String, r: String)
