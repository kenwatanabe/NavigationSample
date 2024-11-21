import Foundation

final class PinFirstAgreementRouter: ObservableObject {
    @Published var isActive = false
    @Published var passwordStore: PinFirstPasswordInputStore?
    
    func navigateToNext() {
        passwordStore = PinFirstPasswordInputStore()
        isActive = true
    }
}
