import Foundation
public import Combine

class ThisOrThatVM: ObservableObject {    
    @Published var question: String = "Cats or Dogs"
    @Published var leftOption: String = "Cats"
    @Published var rightOption: String = "Dogs"
    @Published var choice = -1
    
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
