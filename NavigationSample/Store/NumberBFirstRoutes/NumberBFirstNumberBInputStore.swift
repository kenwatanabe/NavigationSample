import Foundation

final class NumberBFirstNumberBInputStore: ObservableObject {
    @Published var numberB: String = ""
    @Published var isValid: Bool = false
    
    func updateNumber(_ number: String) {
        numberB = number
        validate()
    }
    
    private func validate() {
        isValid = !numberB.isEmpty
    }
}
