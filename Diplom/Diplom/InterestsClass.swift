import Foundation
import UIKit

class Interest {
   
    let interest: String
    internal init(interest: String) {
        self.interest = interest
    }
}

class InterestManager {
    static let interest: [Interest] = [
        Interest(interest: "Entertainment"),
        Interest(interest: "Biology"),
        Interest(interest: "Astronomy"),
        Interest(interest: "History"),
        Interest(interest: "Languages"),
        Interest(interest: "Physics"),
        Interest(interest: "Anatomy"),
        Interest(interest: "Engeneering")
    ]
}
