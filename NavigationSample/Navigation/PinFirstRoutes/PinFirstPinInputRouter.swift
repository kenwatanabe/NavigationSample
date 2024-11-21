import Foundation

final class PinFirstPinInputRouter: ObservableObject {
    @Published var isActive = false
    @Published var agreementStore: PinFirstAgreementStore?
    
    func navigateToNext() {
        agreementStore = PinFirstAgreementStore()
        isActive = true
    }
}
