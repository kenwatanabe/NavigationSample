import Foundation

final class PasswordFirstPasswordInputRouter: ObservableObject {
    @Published var isActive = false
    @Published var agreementStore: PasswordFirstAgreementStore?
    
    func navigateToNext() {
        agreementStore = PasswordFirstAgreementStore()
        isActive = true
    }
}
