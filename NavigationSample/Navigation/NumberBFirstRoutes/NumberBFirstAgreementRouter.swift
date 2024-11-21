import Foundation

final class NumberBFirstAgreementRouter: ObservableObject {
    @Published var isActive = false
    @Published var passwordStore: NumberBFirstPasswordInputStore?
    
    func navigateToNext() {
        passwordStore = NumberBFirstPasswordInputStore()
        isActive = true
    }
}
