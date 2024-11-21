import SwiftUI

struct PinFirstAgreementView: View {
    @ObservedObject var store: PinFirstAgreementStore
    @StateObject private var router = PinFirstAgreementRouter()
    
    var body: some View {
        VStack {
            AgreementUI(
                state: .init(
                    isAgreed: store.isAgreed,
                    hasReadToBottom: store.hasReadToBottom,
                    canProceed: store.canProceed,
                    errorMessage: !store.canProceed ? "PIN規約を最後まで読み、同意してください" : nil
                ),
                dispatch: { action in
                    switch action {
                    case .updateAgreement(let agreed):
                        store.updateAgreement(agreed)
                    case .updateReadStatus(let hasRead):
                        store.updateReadStatus(hasRead)
                    case .next:
                        router.navigateToNext()
                    }
                }
            )
            
            NavigationLink(
                isActive: $router.isActive,
                destination: {
                    if let passwordStore = router.passwordStore {
                        PinFirstPasswordInputView(store: passwordStore)
                    }
                }
            ) { EmptyView() }
        }
    }
}
