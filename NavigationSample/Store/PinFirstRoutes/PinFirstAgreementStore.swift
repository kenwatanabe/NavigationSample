import Foundation

final class PinFirstAgreementStore: ObservableObject {
    @Published var isAgreed = false
    @Published var hasReadToBottom = false
    @Published var canProceed: Bool = false
    
    func updateAgreement(_ agreed: Bool) {
        isAgreed = agreed
        updateProceedStatus()
    }
    
    func updateReadStatus(_ hasRead: Bool) {
        hasReadToBottom = hasRead
        updateProceedStatus()
    }
    
    private func updateProceedStatus() {
        canProceed = isAgreed && hasReadToBottom
    }
}
