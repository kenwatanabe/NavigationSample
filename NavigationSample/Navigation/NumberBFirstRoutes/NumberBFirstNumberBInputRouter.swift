import Foundation

final class NumberBFirstNumberBInputRouter: ObservableObject {
    @Published var isActive = false
    @Published var agreementStore: NumberBFirstAgreementStore?
    
    func navigateToNext() {
        agreementStore = NumberBFirstAgreementStore()
        isActive = true
    }
}
